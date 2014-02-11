class Reservation < ActiveRecord::Base

	belongs_to :restaurant
	belongs_to :user

	validates_numericality_of :party_number, :greater_than => 1, :less_than => 200
end
