class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :gender, :location])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :gender, :location])
  end

  protected

  def after_sign_in_path_for(resource)
    categories_path
  end
end
