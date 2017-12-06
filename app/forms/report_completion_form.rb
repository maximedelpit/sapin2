# frozen_string_literal: true

# Form object (https://github.com/infinum/rails-handbook/blob/) to manage the report
# completion form (creation report_obligations and dispositions)
# and avoid to manage form logic in the controller
class ReportCompletionForm
  include ActiveModel::Model
  include ActiveModel::Validations::Callbacks

  attr_accessor :report_completion_attributes

  def initialize(report_obligations)
    @report_completion_attributes = report_obligations.inject([]) do |arr, ro|
      arr << { title: ro.obligation.title, rods: ro.initialize_rods }
    end
  end

  def save
    return false unless valid?
  end
end
