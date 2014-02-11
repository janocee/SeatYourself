class Restaurant < ActiveRecord::Base
	validates :name, :address, :description, :category, :presence => true
	validates :num_of_seats, numericality: { only_integer: true }
	validates :phone_number, format: { with: /\d{3}-\d{3}-\d{4}/, message: "bad format" }
	has_many :reservations
	has_many :users, :through => :reservations

	def self.search(search)
		if search
			find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
		else
			find(:all)
		end
	end


	def availability(party_size)
		reservations.sum(:party_number) + party_size <= num_of_seats
	end
end
