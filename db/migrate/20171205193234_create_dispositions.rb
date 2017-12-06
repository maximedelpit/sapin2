class CreateDispositions < ActiveRecord::Migration[5.1]
  def change
    create_table :dispositions do |t|
      t.string :title
      t.references :obligation, foreign_key: true

      t.timestamps
    end
  end
end
