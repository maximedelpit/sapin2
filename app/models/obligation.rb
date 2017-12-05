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
  enum category: %i[main other]

  has_many :dispositions, dependent: :destroy
end
