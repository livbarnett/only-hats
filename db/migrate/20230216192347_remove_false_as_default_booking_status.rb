class RemoveFalseAsDefaultBookingStatus < ActiveRecord::Migration[7.0]
  def change
    change_column_default :bookings, :status, nil
  end
end
