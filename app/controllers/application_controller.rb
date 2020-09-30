class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  add_flash_types :info, :success
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :invite_token])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:invite_token])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end
end
