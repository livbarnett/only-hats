class UsersController < ApplicationController
  def show
    @user = current_user
    @hats = @user.hats
  end
end
 