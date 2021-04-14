class ProfileController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])
    #@favorite_businesses = @user.users_businesses.all
    @favorite_businesses = UsersBusiness.find_by(user: current_user, business: @business)
  end
end
