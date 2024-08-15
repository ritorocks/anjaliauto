class ApplicationController < ActionController::Base
  skip_forgery_protection
  #before_action :authenticate_employee!
  #before_action :configure_permitted_parameters, if: :devise_controller?

  #def configure_permitted_parameters
    #devise_parameter_sanitizer.permit(:sign_up, :keys => [:email, :image_url])

    #devise_parameter_sanitizer.permit(:account_update, :keys => [:name, :image_url])
  #end
end
