# frozen_string_literal: true

# Display and manage reports
class ReportsController < ApplicationController
  def show
    @report = Report.find(params[:id])
  end
end
