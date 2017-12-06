# frozen_string_literal: true

# Displays all the important obligations and their dispositions for a given report
class ImportantReportObligationsController < ApplicationController
  def index
    @report = Report.find(params[:report_id])
    @report_obligations = @report.report_obligations.important.includes(obligation: :dispositions)
  end
end
