# frozen_string_literal: true

# == Schema Information
#
# Table name: reports
#
#  id         :integer          not null, primary key
#  score      :float
#  result     :integer
#  company_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_reports_on_company_id  (company_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#

# Model which present the overview of the report (score and result)
class Report < ApplicationRecord
  enum result: %i[not_concerned partly_concerned concerned]

  belongs_to :company
  has_many :report_obligations, dependent: :destroy
  has_many :report_obligation_tasks, through: :report_obligations

  validates :score, presence: true
  validates :result, presence: true

  def find_result
    case score
    when 5.5..15.5
      'partly_concerned'
    when 15.5..20
      'concerned'
    else
      'not_concerned'
    end
  end

  def report_task_by_status
    translate_state = {"to_do" => "À faire", "done" => "Fait", "doing" => "En cours"}
    task_by_status = report_obligation_tasks.group(:status).count.transform_keys{ |key| translate_state[key] }
    total_tasks = report_obligation_tasks.count
    convert_values_to_percentages(task_by_status, total_tasks)
  end

  def report_task_by_obligation_and_status
    report_obligation_tasks.eager_load(report_obligation: :obligation)
                           .order('obligations.title')
                           .group(:status, 'obligations.title')
                           .count
  end

  private

  def convert_values_to_percentages(task_by_status, total_tasks)
    task_by_status.transform_values { |v| (v.to_f / total_tasks * 100).round(1) }
  end
end
