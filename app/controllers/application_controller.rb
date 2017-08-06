class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name, :studio_name, :description, :tags, :founded_in, :avatar, :background_image])
  end

end
