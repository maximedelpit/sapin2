# frozen_string_literal: true

# Initialize the report for a company and all the associated objects
# (prospect, company, report_obligations)
class ReportInitializor
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
      obligation.create_report_obligation(@report)
    end
  end
end
