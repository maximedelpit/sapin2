# frozen_string_literal: true

# Form object (https://github.com/infinum/rails-handbook/blob/) to manage the report
# finalisation form (creation report_obligations and tasks)
# and avoid to manage form logic in the controller
class ReportFinalisationForm
  include ActiveModel::Model
  include ActiveModel::Validations::Callbacks

  attr_accessor :report_tasks

  def save
    return false unless valid?
    ActiveRecord::Base.transaction do
      create_report_tasks(report_tasks)
    end
    true
  rescue ActiveRecord::StatementInvalid => e
    errors.add(:base, e.message)
    false
  end

  private

  def create_report_tasks(report_tasks)
    report_tasks.each do |report_task|
      create_report_task(report_task)
    end
  end

  def create_report_task(report_task)
    report_obligation = ReportObligation.find(report_task[:report_obligation_id])
    task = Task.find(report_task[:task_id])
    ReportObligationTask.create!(status: report_task[:status], task: task,
                                 report_obligation: report_obligation)
  end
end
