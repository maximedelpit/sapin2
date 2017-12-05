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
  enum localisation: %i[france abroad]
  enum type: %i[epic subsidiary company_group company]
  enum turnover: %i[less_100 more_100]
  enum employees_count: %i[less_50 50_to_500 more_500]

  belongs_to :prospect
  has_one :report, dependent: :nullify
end
