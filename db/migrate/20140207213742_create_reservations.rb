class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :party_number
      t.datetime :time_of_reso

      t.timestamps
    end
  end
end
