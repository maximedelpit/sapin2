# frozen_string_literal: true

# Form object (https://github.com/infinum/rails-handbook/blob/) to manage the report
# finalisation form (creation report_obligations and dispositions)
# and avoid to manage form logic in the controller
class ReportFinalisationForm
  include ActiveModel::Model
  include ActiveModel::Validations::Callbacks

  attr_accessor :rods

  def save
    return false unless valid?
    ActiveRecord::Base.transaction do
      create_rods(rods)
    end
    true
  rescue ActiveRecord::StatementInvalid => e
    errors.add(:base, e.message)
    false
  end

  def create_rods(rods)
    rods.each do |rod|
      report_obligation = ReportObligation.find(rod[:report_obligation_id])
      disposition = Disposition.find(rod[:disposition_id])
      ReportObligationDisposition.create!(status: rod[:status], disposition: disposition,
                                          report_obligation: report_obligation)
    end
  end
end
