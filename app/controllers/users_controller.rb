class UsersController < ApplicationController
  #load_and_authorize_resource
  before_action :authenticate_user! , except: [:show]
  before_action :set_user

  def business_profile
    if current_user.id != @user.id
      redirect_to business_path 
    else
     @business = @user.businesses.all
     #@liked_business = @user.liked_business
     @liked_businesses = UsersBusiness.find_by(user: @user, business: @biss) 
     @liked_business = @user.liked_business
    end

    @roles = @user.roles.all
  end
  def show
    
  end
  def edit
      authorize @user
  end

  def update
    authorize @user
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
