# frozen_string_literal: true

# Model the prospects who will use the website to generate a report
class Prospect < ApplicationRecord
  belongs_to :company
end
