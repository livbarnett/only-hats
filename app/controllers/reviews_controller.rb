class ReviewsController < ApplicationController
  before_action :set_booking, only: %i[new create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.booking = @booking
    if @review.save
      redirect_to hat_path(@booking.hat), notice: "Review was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating, :booking_id)
  end
end
