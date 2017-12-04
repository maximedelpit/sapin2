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

# Model which present the overview of the report (score and result)
class Report < ApplicationRecord
  belongs_to :company
end
