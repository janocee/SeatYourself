class AddDateToReservation < ActiveRecord::Migration
  def change
  	add_column :reservations, :date_of_reso, :date
  end
end
