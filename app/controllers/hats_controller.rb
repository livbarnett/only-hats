class HatsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]

  def index
    if params[:type].present?
      @hats = Hat.hat_type_search(params[:type])
    elsif params[:query].present?
      @hats = Hat.hat_search(params[:query])
    else
      @hats = Hat.all
    end
  end

  def show
    @hat = Hat.find(params[:id])
    @booking = Booking.new
    @reviews = @hat.bookings.map(&:review).compact
  end

  def new
    @hat = Hat.new
  end

  def create
    @hat = Hat.new(hat_params)
    if @hat.save
      redirect_to @hat, notice: "Hat was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @hat = Hat.find(params[:id])
  end

  def update
    @hat = Hat.find(params[:id])
    if @hat.update(hat_params)
      redirect_to @hat, notice: "hat was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def hat_params
    params.require(:hat).permit(:name, :size, :photo, :location, :type, :color, :description, :day_rate)
  end
end
