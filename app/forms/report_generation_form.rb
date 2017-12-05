# frozen_string_literal: true

# Form object (https://github.com/infinum/rails-handbook/blob/) to manage the report
# generation form and avoid to manage form logic in the controller
class ReportGenerationForm
  include ActiveModel::Model
  include ActiveModel::Validations::Callbacks

  attr_accessor :first_name
  attr_accessor :phone_number, :phone_number_normalized
  attr_accessor :email
  attr_accessor :role
  attr_accessor :localisation
  attr_accessor :firm_type
  attr_accessor :employees_count
  attr_accessor :turnover

  phony_normalize :phone_number, as: :phone_number_normalized

  validates :first_name, presence: true
  validates :phone_number, presence: true
  validates_plausible_phone :phone_number_normalized, presence: true
  validates :email, presence: true, email: true
  validates :role, presence: true, inclusion: { in: Prospect.roles.keys }
  validates :localisation, presence: true, inclusion: { in: Company.localisations.keys }
  validates :firm_type, presence: true, inclusion: { in: Company.types.keys }
  validates :turnover, presence: true, inclusion: { in: Company.turnovers.keys }
  validates :employees_count, presence: true, inclusion: { in: Company.employees_counts.keys }

  def save
    return false unless valid?
    # create prospects (with geocoder address)
    # create company
  end
end
