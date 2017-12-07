# frozen_string_literal: true

# == Schema Information
#
# Table name: report_obligation_tasks
#
#  id                   :integer          not null, primary key
#  report_obligation_id :integer
#  task_id              :integer
#  status               :integer          default("to_do"), not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
# Indexes
#
#  index_report_obligation_tasks_on_report_obligation_id  (report_obligation_id)
#  index_report_obligation_tasks_on_task_id               (task_id)
#
# Foreign Keys
#
#  fk_rails_...  (report_obligation_id => report_obligations.id)
#  fk_rails_...  (task_id => tasks.id)
#

# Model the status of all tasks the company has to take for a given obligations
class ReportObligationTask < ApplicationRecord
  enum status: %i[to_do doing done]

  belongs_to :report_obligation
  belongs_to :task

  validates :status, presence: true, inclusion: { in: ReportObligationTask.statuses.keys }
end
