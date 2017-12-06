# frozen_string_literal: true

# Allows to render the chart in the report finalisation show without worrying about timeouts
# --> https://github.com/ankane/chartkick#say-goodbye-to-timeouts
class ChartsController < ApplicationController
  def completed_tasks
    @report = Report.find(params[:report_id])
    render json: @report.report_obligation_tasks.group(:status).count
  end
end
