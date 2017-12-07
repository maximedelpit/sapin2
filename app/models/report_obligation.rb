# frozen_string_literal: true

# == Schema Information
#
# Table name: report_obligations
#
#  id            :integer          not null, primary key
#  report_id     :integer
#  obligation_id :integer
#  status        :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_report_obligations_on_obligation_id  (obligation_id)
#  index_report_obligations_on_report_id      (report_id)
#
# Foreign Keys
#
#  fk_rails_...  (obligation_id => obligations.id)
#  fk_rails_...  (report_id => reports.id)
#

# Link a report and its obligations and show their status depending on the result of the report
class ReportObligation < ApplicationRecord
  enum status: %i[not_needed recommended needed]

  belongs_to :report
  belongs_to :obligation
  has_many :report_obligation_tasks, dependent: :nullify

  validates :status, presence: true, inclusion: { in: ReportObligation.statuses.keys }

  scope :minor, (-> { includes(:obligation).where(obligations: { category: 'minor' }) })
  scope :important, (-> { includes(:obligation).where(obligations: { category: 'important' }) })

  def initialize_report_tasks
    obligation.tasks.inject([]) do |arr, task|
      arr << ReportObligationTask.new(task: task, report_obligation: self)
    end
  end
end
