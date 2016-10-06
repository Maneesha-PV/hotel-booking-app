class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable 
  has_many :bookings
  has_many :hotels, through: :bookings
  has_many :rooms, through: :bookings
  enum role: [:user, :admin, :super_admin ]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
