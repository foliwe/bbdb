class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :verify_user_steps!

  

  


  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:title, :first_name, :last_name])
  end
  
  def verify_user_steps!
    return if devise_controller?
    return unless user_signed_in?
    return if current_user.terms
    redirect_to after_signup_path(:terms),notice: 'You most accept Terms and conditions.'
  end
end
