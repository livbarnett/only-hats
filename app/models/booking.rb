class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :hat
  validates_uniqueness_of :hat_id, scope: %i[start_date end_date]
end
