# frozen_string_literal: true

# generate the report for a company and all the associated objects
class ReportGenerator
  def initialize(company_id)
    @company = Company.find_by(id: company_id)
  end

  def call
    create_report
  end

  private

  def create_report
    score = @company.calculate_score
    Report.create(company: @company, score: score, result: get_result(score))
  end

  def get_result(score)
    case score
    when 5.5..15.5
      'partly_concerned'
    when 15.5..20
      'concerned'
    else
      'not_concerned'
    end
  end
end
