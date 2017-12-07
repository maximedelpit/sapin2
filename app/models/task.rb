# frozen_string_literal: true

# == Schema Information
#
# Table name: tasks
#
#  id            :integer          not null, primary key
#  title         :string
#  obligation_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_tasks_on_obligation_id  (obligation_id)
#
# Foreign Keys
#
#  fk_rails_...  (obligation_id => obligations.id)
#

# Model the task that company should take to respect the obligations of the Sapin2 law
class Task < ApplicationRecord
  belongs_to :obligation
  has_many :report_obligation_tasks, dependent: :nullify

  def create_report_report_task(report_obligation)
    report_obligation_tasks.create(report_obligation: report_obligation)
  end

  def task.build_report_task(report_obligation)
    report_obligation_tasks.build(report_obligation: report_obligation)
  end
end
