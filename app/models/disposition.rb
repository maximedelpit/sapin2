# frozen_string_literal: true

# == Schema Information
#
# Table name: dispositions
#
#  id            :integer          not null, primary key
#  title         :string
#  obligation_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_dispositions_on_obligation_id  (obligation_id)
#
# Foreign Keys
#
#  fk_rails_...  (obligation_id => obligations.id)
#

# Model the disposition that company should take to respect the obligations of the Sapin2 law
class Disposition < ApplicationRecord
  belongs_to :obligation
  has_many :report_obligation_dispositions, dependent: :nullify

  def create_report_obligation_disposition(report_obligation)
    report_obligation_dispositions.create(report_obligation: report_obligation)
  end
end
