class UsersController < ApplicationController
  #load_and_authorize_resource
  before_action :authenticate_user! , except: [:show]
  before_action :set_user

  def business_profile
    if current_user != @user
      redirect_to business_path 
    else
     @business = @user.businesses.all
    end

    @roles = @user.roles.all
  end
  def show
    
  end
  def edit
      
  end

  def update
    if @user.update(params_user)
      redirect_to user_path(@user), notice: "Account Updated"
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.friendly.find(params[:id])
  end

  def params_user
    params.require(:user).permit(role_ids: [])
  end
 
end
