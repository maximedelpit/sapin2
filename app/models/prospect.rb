# frozen_string_literal: true

# == Schema Information
#
# Table name: prospects
#
#  id             :integer          not null, primary key
#  first_name     :string
#  address        :jsonb
#  phone_number   :string
#  email          :string
#  role           :integer
#  is_responsible :boolean          default(FALSE), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

# Model the prospects who will use the website to generate a report
class Prospect < ApplicationRecord
  enum role: %i[admin_board surveillance_board directory operation_director other]

  has_one :company, dependent: :nullify
end
