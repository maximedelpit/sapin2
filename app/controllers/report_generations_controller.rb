# frozen_string_literal: true

# Controller to gather infos about the prospect and create the report for its company
class ReportGenerationsController < ApplicationController
  def new
    @form = ReportGenerationForm.new
  end

  def create
    @form = ReportGenerationForm.new(report_generation_form_params)
    if @form.save
      report = ReportGenerator.new(@form.company.id).call
      redirect_to report_path(report)
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
