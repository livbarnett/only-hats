class Hat < ApplicationRecord
  self.inheritance_column = :not_type
  has_one_attached :photo
  has_many :bookings
  has_many :users, through: :bookings
  has_many :reviews, through: :bookings
end
