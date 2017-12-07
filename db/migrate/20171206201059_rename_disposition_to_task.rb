class RenameDispositionToTask < ActiveRecord::Migration[5.1]
  def change
    rename_table :dispositions, :tasks
    rename_table :report_obligation_dispositions, :report_obligation_tasks
  end
end
