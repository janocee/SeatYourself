class AddStuffToRestaurant < ActiveRecord::Migration
  def change
  	add_column :restaurants,:phone_number, :string
  	add_column :restaurants,:url, :string
  	add_column :restaurants,:description, :text
  	add_column :restaurants,:category, :string
  end
end
