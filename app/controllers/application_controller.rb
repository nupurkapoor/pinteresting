class ApplicationController < ActionController::Base
 # Prevent CSRF attacks by raising an exception.
 # For APIs, you may want to use :null_session instead.
 protect_from_forgery with: :exception
 before_filter :configure_permitted_parameters, if: :devise_controller?

protected

  def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :avatar) }
   devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :current_password, :avatar) }
  end
end

# def configure_permitted_parameters
#   devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password) }
#   devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :password, :remember_me) }
#   devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :full_name, :description, :password, :current_password, :password_confirmation, :avatar) }
# end

