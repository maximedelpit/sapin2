# frozen_string_literal: true

# Displays all the minor obligations and their dispositions for a given report
class MinorReportObligationsController < ApplicationController
  def index
    @report = Report.find(params[:report_id])
    @report_obligations = @report.report_obligations.minor.includes(obligation: :dispositions)
  end
end
