# frozen_string_literal: true

# Displays all the important obligations and their tasks for a given report
class ImportantReportObligationsController < ApplicationController
  def index
    @report = Report.find(params[:id])
    @report_obligations = @report.report_obligations.important.includes(obligation: :tasks)
  end
end
