class ChangeOpeningCLosingToInt < ActiveRecord::Migration
  def change
  	change_column :restaurants, :open_at, :integer
  	change_column :restaurants, :close_at, :integer
  end
end
