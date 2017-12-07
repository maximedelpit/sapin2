# frozen_string_literal: true

# Interface object to make the necessary ressources available to the report finalisation show
class DashboardFacade
  attr_reader :report

  def initialize(report_id)
    @report = Report.find(report_id)
  end

  def prospect
    @prospect ||= @report.company.prospect
  end

  def report_obligations
    @report_obligations ||=
      @report.report_obligations.includes(:obligation, report_obligation_tasks: :task)
  end

  # bad practice to have it here (should be in ChartsController) but weirdly the same query
  # does not render the same chart when inserted from the controller
  # --> https://github.com/ankane/chartkick#say-goodbye-to-timeouts
  def column_chart_data
    @column_chart_data ||= @report.report_task_by_obligation_and_status
  end

  def column_chart_options
    {
      library: { scales: { xAxes: [{ ticks: {
        autoSkip: false, maxRotation: 10,
        minRotation: 10, labelOffset: 70
      } }] } }
    }
  end
end
