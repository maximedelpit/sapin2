# frozen_string_literal: true

# Controller to the dispositions taken by a company for a given report
class ReportFinalisationsController < ApplicationController
  def create
    @form = ReportFinalisationForm.new(report_finalisation_form_params)
    if @form.save
      redirect_to_correct_page(params[:go_to], params[:report_id])
    else
      render_form(params[:go_to], params[:report_id])
    end
  end

  private

  def redirect_to_correct_page(go_to, report_id)
    case go_to
    when 'part2'
      redirect_to report_part2_index_path(report_id)
    when 'dashboard'
      redirect_to report_dashboard_path(report_id)
    else
      redirect_to back
    end
  end

  def render_form(go_to, _report_id)
    case go_to
    when 'part2'
      render 'important_report_obligations/index'
    when 'dashboard'
      render 'minor_report_obligations/index'
    else
      redirect_to back
    end
  end

  def report_finalisation_form_params
    params.permit(rods: %i[status disposition_id report_obligation_id])
  end
end
