class Booking < ApplicationRecord
	#belongs_to :room
	#belongs_to :hotel
	belongs_to :admin
	belongs_to :room_type
	validate :time_cannot_be_in_the_past
	#validate :cannot_overlap_another_booking
	def time_cannot_be_in_the_past
		if check_in_date < Time.now
			 errors.add(:check_in_date, "can't be in the past")
		end
	end

end
