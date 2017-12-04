class CreateProspects < ActiveRecord::Migration[5.1]
  def change
    create_table :prospects do |t|
      t.string :first_name
      t.jsonb :address
      t.string :phone_number
      t.string :email
      t.integer :role
      t.boolean :is_responsible
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
