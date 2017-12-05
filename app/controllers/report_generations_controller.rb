# frozen_string_literal: true

# Controlelr to gather infos about the prospect
class ReportGenerationsController < ApplicationController
  def new
    @form = ReportGenerationForm.new
  end

  def create
    @form = ReportGenerationForm.new(report_generation_form_params)
    if @form.save
      ReportGenerator.new(@form.company.id).call
    else
      render :new
    end
  end

  private

  def report_generation_form_params
    params.require(:report_generation_form).permit(:first_name, :phone_number, :email,
                                                   :role, :localisation, :firm_type,
                                                   :employees_count, :turnover)
  end
end
