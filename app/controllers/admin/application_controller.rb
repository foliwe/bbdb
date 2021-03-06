# All Administrate controllers inherit from this
# `Administrate::ApplicationController`, making it the ideal place to put
# authentication logic or other before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    include Administrate::Punditize
    before_action :authenticate_user!
    before_action :authenticate_admin

    def authenticate_admin
      redirect_to root_path, alert: 'Not authorized.' unless current_user.has_role?(:admin) or current_user.has_role?(:superAdmin) or current_user.has_role?(:editor)
   
    end

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end
  end
end
