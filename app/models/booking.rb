class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :hat
  has_one :review, dependent: :destroy
  validates :start_date, :end_date, presence: true, uniqueness: { scope: :hat_id, message: "This hat is already booked for those dates." }
  validate :start_date_before_end_date
  validate :start_date_in_future

  private

  def start_date_before_end_date
    if start_date.present? && end_date.present? && start_date > end_date
      errors.add(:start_date, "must be before end date")
    end
  end

  def start_date_in_future
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "must be in the future")
    end
  end
end
