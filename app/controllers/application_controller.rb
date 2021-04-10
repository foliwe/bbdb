class ApplicationController < ActionController::Base
  include Pagy::Backend
  include Pundit
    protect_from_forgery with: :exception
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :verify_user_steps!
  
  
  
   @date = Time.new()
  


  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:title, :first_name, :last_name])
  end
  
  def verify_user_steps!
    return if devise_controller?
    return unless user_signed_in?
    return if current_user.terms
    redirect_to after_signup_path(:terms),notice: 'You must accept Terms Of Use.'
  end

  private
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
