class RenameTypetoFirmType < ActiveRecord::Migration[5.1]
  def change
    rename_column :companies, :type, :firm_type
  end
end
