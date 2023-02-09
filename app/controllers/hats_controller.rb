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
end
