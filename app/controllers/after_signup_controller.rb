class AfterSignupController < ApplicationController
    before_action :authenticate_user!
    skip_before_action :verify_user_steps!
    include Wicked::Wizard

    steps :terms, :privacy

    def show
        @user = current_user
       
        case steps
            when :terms
                
            when :privacy
        end

        render_wizard
    end

    def update
      @user = current_user
      @user.update(terms: :true)
      render_wizard @user
    end

    private

    def redirect_to_finish_wizard(options, params)
        redirect_to new_business_path ,notice: 'Business Info.'
    end
end