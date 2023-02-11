class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: :home
  def home
    @hats = Hat.all
  end

  def profile
    @hats = Hat.all
  end
end
