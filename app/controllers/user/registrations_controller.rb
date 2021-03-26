class User::RegistrationsController < Devise::RegistrationsController
        prepend_before_action :check_captcha, only: :create

        def after_sign_up_path_for(resource)
            after_signup_path(:terms)
        end
    private

    def check_captcha
        unless verify_recaptcha
            self.resource = resource_class.new sign_up_params
            resource.validate 
            set_minimum_password_length
            respond_with_navigational(resource){render :new}
        end
    end
end