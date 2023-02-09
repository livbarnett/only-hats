class HatsController < ApplicationController

  def index
    @hats = Hat.all
    @search = params["search"]
    if @search.present?
      @hats = @hats.where("name ILIKE ?", "%#{@search}%")
    end
  end

  def show
    @hat = Hat.find(params[:id])
  end

  def new
    @hat = Hat.new
  end

  def create
    @hat = Hat.new(hat_params)
    if @hat.save
      redirect_to @hat, notice: "hat was successfully created."
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
    params.require(:hat).permit(:size, :photo, :location, :type, :color, :description, :day_rate)
  end
end
