# frozen_string_literal: true

# Form object (https://github.com/infinum/rails-handbook/blob/) to manage the report
# initialization form (step 1) and avoid to manage form logic in the controller
class ReportInitializationForm
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
  attr_accessor :company

  phony_normalize :phone_number

  validates :first_name, presence: true
  validates_plausible_phone :phone_number, presence: true
  validates :email, presence: true, email: true
  validates :role, presence: true, inclusion: { in: Prospect.roles.keys }
  validates :localisation, presence: true, inclusion: { in: Company.localisations.keys }
  validates :firm_type, presence: true, inclusion: { in: Company.firm_types.keys }
  validates :turnover, presence: true, inclusion: { in: Company.turnovers.keys }
  validates :employees_count, presence: true, inclusion: { in: Company.employees_counts.keys }

  def save
    return false unless valid?
    prospect = Prospect.create(first_name: first_name, phone_number: phone_number,
                               email: email, role: role, is_responsible: responsible?)
    @company = Company.create(localisation: localisation, firm_type: firm_type,
                              turnover: turnover, employees_count: employees_count,
                              prospect: prospect)
  end

  private

  def responsible?
    return true unless role == Prospect.roles.keys.last
    false
  end
end
