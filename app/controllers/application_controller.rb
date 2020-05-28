class ApplicationController < ActionController::Base
    # only allow authenticated users
    before_action :authenticate_user!
    # this will set the layout based on the result of layout_by_resource
    layout :layout_by_resource

    helper_method :current_account

    # look up the current account for the logged in user
    def current_account 
        @current_account ||= current_user.account
        @current_account
    end

    protected
    # tells you what layout to use based if devise_controller? is true or false
    def layout_by_resource
        if devise_controller?
            "devise"
        else
            "application"
        end
    end
end
