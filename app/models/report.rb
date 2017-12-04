# frozen_string_literal: true

# Model which present the overview of the report (score and result)
class Report < ApplicationRecord
  belongs_to :company
end
