class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.integer :localisation
      t.integer :type
      t.integer :employees_count
      t.integer :turnover

      t.timestamps
    end
  end
end
