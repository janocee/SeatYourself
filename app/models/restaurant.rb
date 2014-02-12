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

  def time_display(hour)
    if hour > 0 && hour < 12
      "#{hour}:00 AM"
    elsif hour == 12
      "#{hour}:00 PM"
    elsif hour > 12
      "#{hour-12}:00 PM"
    else
      "12:00 AM"
    end
  end

	def hours
		(open_at..close_at).to_a.map { |h| [ time_display(h), h] }
		#[,h, h] first h is what gets displayed, second h is what gets passed back to the server
	end
end
