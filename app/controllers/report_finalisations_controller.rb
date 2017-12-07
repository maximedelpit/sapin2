# frozen_string_literal: true

# Controller to the tasks taken by a company for a given report
class ReportFinalisationsController < ApplicationController
  def create
    @form = ReportFinalisationForm.new(report_finalisation_form_params)
    if @form.save
      redirect_to_correct_page(params[:go_to], params[:id])
    else
      render_form(params[:go_to], params[:report_id])
    end
  end

  def show
    @dashboard = DashboardFacade.new(params[:id])
  end

  private

  def redirect_to_correct_page(go_to, report_id)
    case go_to
    when 'part2'
      redirect_to part2_report_path(report_id)
    when 'dashboard'
      redirect_to dashboard_report_path(report_id)
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
    params.permit(report_tasks: %i[status task_id report_obligation_id])
  end
end
