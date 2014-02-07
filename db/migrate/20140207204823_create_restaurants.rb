class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :location
      t.integer :num_of_seats
      t.datetime :open_at
      t.datetime :close_at

      t.timestamps
    end
  end
end
