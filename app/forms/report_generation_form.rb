# frozen_string_literal: true

# Form object (https://github.com/infinum/rails-handbook/blob/) to manage the report
# generation form
class ReportGenerationForm
  include ActiveModel::Model

  attr_accessor :first_name
  attr_accessor :address
  attr_accessor :phone_number
  attr_accessor :email
  attr_accessor :role
  attr_accessor :localisation
  attr_accessor :firm_type
  attr_accessor :employee_count
  attr_accessor :turnover

  def save
    return false unless valid?

    # create prospects (with geocoder address)
    # create company
  end
end
