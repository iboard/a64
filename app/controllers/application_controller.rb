# = ApplicationController
# Defines globaly used helper_methods and 'current_user'
class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  # @return [User] user from session[:user_id] or nil
  def current_user
    @current_user ||= User.find(session[:user_id])
  rescue
    nil
  end

end
