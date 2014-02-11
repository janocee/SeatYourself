class Reservation < ActiveRecord::Base

	belongs_to :restaurant
	belongs_to :user

	validates_numericality_of :party_number, :greater_than => 1

	validate :availability

	def availability
		if !restaurant.availability(party_number)
			errors.add(:base, "No more room!!! Go away!")
		end
	end
end
