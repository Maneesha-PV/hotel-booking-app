class Hotel < ApplicationRecord
	has_many :rooms
	has_many :bookings
	has_many :users
	has_one :admin
	validates_uniqueness_of :name
end
