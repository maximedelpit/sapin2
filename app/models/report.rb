# frozen_string_literal: true

# == Schema Information
#
# Table name: reports
#
#  id         :integer          not null, primary key
#  score      :integer
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
  belongs_to :company
end
