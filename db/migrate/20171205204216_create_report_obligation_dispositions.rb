class CreateReportObligationDispositions < ActiveRecord::Migration[5.1]
  def change
    create_table :report_obligation_dispositions do |t|
      t.references :report_obligation, foreign_key: true
      t.references :disposition, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
