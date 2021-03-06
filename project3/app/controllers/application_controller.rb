# frozen_string_literal: true

class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :remember_me])
        devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password, :remember_me])
        devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password, :current_password, :remember_me])
    end

    def after_sign_up_path_for(resource)
        user_path(current_user)
    end

    def after_sign_in_path_for(resource)
        user_path(current_user)
    end

    def after_sign_out_path_for(resource)
        root_path
    end

    def after_inactive_sign_up_path_for(resource)
        super(resource)
    end
end
