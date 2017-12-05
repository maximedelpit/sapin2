class CreateObligations < ActiveRecord::Migration[5.1]
  def change
    create_table :obligations do |t|
      t.string :title
      t.integer :category

      t.timestamps
    end
  end
end
