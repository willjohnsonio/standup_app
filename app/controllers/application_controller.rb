class ApplicationController < ActionController::Base
    # only allow authenticated users
    before_action :authenticate_user!
    # this will set the layout based on the result of layout_by_resource
    layout :layout_by_resource

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
