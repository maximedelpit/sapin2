class RenameDispoRefToTask < ActiveRecord::Migration[5.1]
  def change
    rename_column :report_obligation_tasks, :disposition_id, :task_id
  end
end
