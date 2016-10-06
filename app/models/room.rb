class Room < ApplicationRecord
	has_many :room_types
	belongs_to :admin
end
