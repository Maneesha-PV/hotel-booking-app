class RoomAvailability < ApplicationRecord
	validates_presence_of :from, :to
end
