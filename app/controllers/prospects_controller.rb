# frozen_string_literal: true

# Controlelr to gather infos about the prospect
class ProspectsController < ApplicationController
  def new
    @form = ReportGenerationForm.new
  end

  def create
    @form = ReportGenerationForm.new(report_generation_form_params)
    @form.save
  end

  private

  def report_generation_form_params
    params.require(:report_generation_form).permit(:first_name, :address, :phone_number, :email,
                                                   :role, :localisation, :firm_type,
                                                   :employee_count, :turnover)
  end
end
