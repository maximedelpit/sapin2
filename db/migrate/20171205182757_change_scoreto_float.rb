class ChangeScoretoFloat < ActiveRecord::Migration[5.1]
  def change
    change_column :reports, :score, :float
  end
end
