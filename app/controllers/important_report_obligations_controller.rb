# frozen_string_literal: true

# Displays all the important obligations and their dispositions for a given report
class ImportantReportObligationsController < ApplicationController
  def index
    @form = ReportCompletionForm.new(find_report_obligations)
  end

  private

  def find_report_obligations
    Report.find(params[:report_id])
          .report_obligations
          .important
          .includes(obligation: :dispositions)
  end
end
