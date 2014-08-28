class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  
  def login_user!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end
  
  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by_session_token(session[:session_token])
  end
  
  def require_no_user!
    redirect_to cats_url unless current_user.nil?
  end
end
