class Room < ApplicationRecord
	has_many :room_types
	has_many :bookings
	belongs_to :admin
	validates_uniqueness_of :room_number
end
