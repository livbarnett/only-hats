class Hat < ApplicationRecord
  self.inheritance_column = :not_type
  has_one_attached :photo
  has_many :bookings
  has_many :users, through: :bookings
  has_many :reviews, through: :bookings

  include PgSearch::Model
  pg_search_scope :hat_search,
    against: %i[ name type location color description ],
    using: {
      tsearch: { prefix: true }
    }

  pg_search_scope :hat_type_search,
    against: %i[ type ],
    using: {
      tsearch: { prefix: true }
    }
end
