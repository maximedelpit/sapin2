# frozen_string_literal: true

# Displays all the minor obligations and their tasks for a given report
class MinorReportObligationsController < ApplicationController
  def index
    @report = Report.find(params[:id])
    @report_obligations = @report.report_obligations.minor.includes(obligation: :tasks)
  end
end
