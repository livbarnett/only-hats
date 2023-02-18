class BookingsController < ApplicationController
  before_action :set_hat, only: %i[create]

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.hat = @hat
    if @booking.save
      redirect_to hat_path(@booking.hat), notice: "Booking request was successfully made."
    else
      redirect_to hat_path(@booking.hat), alert: "Booking could not be created."
    end
  end

  def index
    @bookings = Booking.where(user: current_user)
    @review = Review.new
  end

  private

  def set_hat
    @hat = Hat.find(params[:hat_id])
  end

  def booking_params
    params.require(:booking).permit(:name, :start_date, :end_date)
  end
end
