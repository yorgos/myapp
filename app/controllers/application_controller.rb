class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  # Redirect in case a user tries to edit someone else's details
  rescue_from CanCan::AccessDenied do |exception|
  redirect_to main_app.root_url, :alert => exception.message
  end

end
