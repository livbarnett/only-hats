class Hat < ApplicationRecord
  include PgSearch::Model

  self.inheritance_column = :not_type
  has_one_attached :photo
  has_many :bookings
  has_many :users, through: :bookings

  pg_search_scope :search_by_name_and_type,
  against: [ :name, :type ],
  using: {
    tsearch: { prefix: true }
  }
end
