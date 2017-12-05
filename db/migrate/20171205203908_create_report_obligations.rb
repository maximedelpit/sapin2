class CreateReportObligations < ActiveRecord::Migration[5.1]
  def change
    create_table :report_obligations do |t|
      t.references :report, foreign_key: true
      t.references :obligation, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
