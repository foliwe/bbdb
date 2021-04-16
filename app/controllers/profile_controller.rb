class ProfileController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def show
    @buss = 'Foli'
    @user = User.find(params[:user_id])
    @business = UsersBusiness.find_by(user: current_user, business: liked_business)
    #@favorite_businesses = @user.users_businesses.all
    @favorite_businesses = UsersBusiness.find_by(user: current_user, business: @business)
  end
end
