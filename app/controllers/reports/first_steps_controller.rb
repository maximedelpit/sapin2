# frozen_string_literal: true

module Reports
  # Handles the actions linked to the first step of the report creation (prospect and company infos)
  class FirstStepsController < ApplicationController
    def new
      @form = ReportInitializationForm.new
    end

    def create
      @form = ReportInitializationForm.new(report_initialization_form_params)
      if @form.save
        report = ReportInitializor.new(@form.company.id).call
        redirect_to report_path(report)
      else
        render :new
      end
    end

    def show
      @report = Report.find(params[:id])
    end

    private

    def report_initialization_form_params
      params.require(:report_initialization_form).permit(:first_name, :phone_number, :email,
                                                         :role, :localisation, :firm_type,
                                                         :employees_count, :turnover)
    end
  end
end
