# frozen_string_literal: true

# Controller to the dispositions taken by a company for a given report
class ReportCompletionsController < ApplicationController
  def create
    @form = ReportCompletionForm.call(report_completion_form_params)
    # if @form.save
    #   report = ReportGenerator.new(@form.company.id).call
    #   redirect_to report_path(report)
    # else
    #   render :new
    # end
  end

  def report_completion_form_params
    params.require(:report_completion_form)
          .permit(:part_number, rods: %i[status disposition_id report_obligation_id])
  end
end
