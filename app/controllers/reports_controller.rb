# frozen_string_literal: true

# Display and manage reports
class ReportsController < ApplicationController
  def show
    @report_obligations =
      Report.find(params[:id]).report_obligations.include(:obligation)
  end
end
