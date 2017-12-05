# frozen_string_literal: true

# == Schema Information
#
# Table name: companies
#
#  id              :integer          not null, primary key
#  localisation    :integer
#  type            :integer
#  employees_count :integer
#  turnover        :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  prospect_id     :integer
#
# Indexes
#
#  index_companies_on_prospect_id  (prospect_id)
#

# Model the company the prospects belongs to and
# its properties which will allow generate the report
class Company < ApplicationRecord
  belongs_to :prospect
  has_one :report, dependent: :nullify
end
