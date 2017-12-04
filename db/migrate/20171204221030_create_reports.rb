class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.integer :score
      t.integer :result
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
