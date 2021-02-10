class ApplicationController < ActionController::Base
  before_action :configure_permitted_parmeters, if: :devise_controller?
  before_action :basic_auth


  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
  private
    def configure_permitted_parmeters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:first_name_kan,:last_name_kan,:first_name_kata,:last_name_kata,:birthday])
    end

end
