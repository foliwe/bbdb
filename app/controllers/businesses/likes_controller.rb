class Businesses::LikesController < ApplicationController
  before_action :authenticate_user!
  def create
    business = Business.friendly.find(params[:business_id])
    current_user.users_businesses.create(business: business)
    redirect_to business, notice: "You are now following #{business.business_name}"
  end

  def destroy
    # business = Business.friendly.find(params[:business_id])
    # current_user.users_businesses.find_by(business: business).destroy!
    # redirect_to business, alert: "You unfollow"
    business = Business.friendly.find(params[:business_id])
    user_business = GlobalID::Locator.locate_signed(params[:id])
    user_business.destroy!
    redirect_to business_path(business), alert: "unfollow #{business.business_name}"
  end
end
