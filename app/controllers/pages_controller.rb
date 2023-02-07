class PagesController < ApplicationController
  def home
  end

  def profile
    @hats = Hat.all
  end
end
