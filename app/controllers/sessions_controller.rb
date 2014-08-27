class SessionsController < ApplicationController

  def create
    user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])
    unless user.nil?
      # user.reset_session_token!
      # session[:session_token] = user.session_token
      login_user!(user)
    end
    
    redirect_to root_url
  end

  def destroy
    current_user.session_token = nil
    session[:session_token] = nil
    redirect_to cats_url
  end
end