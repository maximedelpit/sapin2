class AdddefaultStatusReportDisposition < ActiveRecord::Migration[5.1]
  def change
    change_column :report_obligation_dispositions, :status, :integer, default: 0, null: false
  end
end
