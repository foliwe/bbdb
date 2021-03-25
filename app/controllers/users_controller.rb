class UsersController < ApplicationController
  #load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_user

  def business_profile
    if current_user != @user
      redirect_to business_path 
    else
     @business = @user.businesses.all
    end
  end


  private

  def set_user
    @user = User.friendly.find(params[:id])
  end
 
end
