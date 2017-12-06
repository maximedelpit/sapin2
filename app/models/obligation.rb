# frozen_string_literal: true

# == Schema Information
#
# Table name: obligations
#
#  id         :integer          not null, primary key
#  title      :string
#  category   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# Model the legal obligations for the companies concerned by the Sapin2 law
class Obligation < ApplicationRecord
  enum category: %i[important less_important]

  has_many :dispositions, dependent: :destroy
  has_many :report_obligations, dependent: :nullify

  def create_report_obligation(report)
    report_obligations.create(report: report, status: get_status(report))
  end

  private

  def get_status(report)
    if report.not_concerned?
      'not_needed'
    elsif report.concerned? || important?
      'needed'
    else
      'recommended'
    end
  end
end
