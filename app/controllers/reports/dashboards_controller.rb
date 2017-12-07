# frozen_string_literal: true

module Reports
  # Handles the actions linked to the management of the final report
  class DashboardsController < ApplicationController
    def show
      @dashboard = ReportDashboardFacade.new(params[:report_id])
    end
  end
end
