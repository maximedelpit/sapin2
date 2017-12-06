# frozen_string_literal: true

# generate the report for a company and all the associated objects
class ReportGenerator
  def initialize(company_id)
    @company = Company.find_by(id: company_id)
  end

  def call
    create_report
    create_associated_report_obligations
    @report
  end

  private

  def create_report
    @report = Report.create(company: @company, score: @company.calculate_score)
    @report.update(result: @report.find_result)
  end

  def create_associated_report_obligations
    Obligation.all.each do |obligation|
      report_obligation = obligation.create_report_obligation(@report)
      obligation.dispositions.each do |disposition|
        disposition.create_report_obligation_disposition(report_obligation)
      end
    end
  end
end
