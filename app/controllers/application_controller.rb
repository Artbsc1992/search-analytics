class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:username, :email, :password, :password_confirmation)
    end
  end

  def after_sign_in_path_for(resource)
    new_user_session_path
  end
end
