class BookingsController < ApplicationController
  before_action :set_hat, only: %i[create]

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.hat = @hat
    if @booking.save
      redirect_to hat_path(@hat), notice: "Booking request was successfully made."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_hat
    @hat = Hat.find(params[:hat_id])
  end

  def booking_params
    params.require(:booking).permit(:name, :start_date, :end_date)
  end
end