class ApplicationController < ActionController::Base
  protect_from_forgery  with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  def after_sign_in_path_for(resource)
    sign_in_url = new_user_session_url
    if request.referer == sign_in_url
      super
    else
      stored_location_for(resource) || request.referer || root_path
    end
  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password,
      :password_confirmation, :remember_me, :picture, :picture_cache) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password,
      :password_confirmation, :current_password, :picture, :picture_cache) }
    end

  
end
