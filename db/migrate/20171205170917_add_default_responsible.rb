class AddDefaultResponsible < ActiveRecord::Migration[5.1]
  def change
    change_column :prospects, :is_responsible, :boolean, default: false, null: false
  end
end
