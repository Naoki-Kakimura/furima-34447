class ApplicationController < ActionController::Base
  before_action :configure_permitted_parmeters, if: :devise_controller?

  private
    def configure_permitted_parmeters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:first_name_kan,:last_name_kan,:first_name_kata,:last_name_kata,:birthday])
    end

end
