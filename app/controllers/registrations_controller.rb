# Allow RegistrationsController to inherhit methids from Devise
class RegistrationsController < Devise::RegistrationsController
    # call configure_permitted_parameters for any action in ths controller is performed
    before_action :configure_permitted_parameters

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end

    def after_sign_up_path_for(resource)
        new_accounts_path
    end
end