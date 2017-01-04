class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def current_user
    @user ||= User.find_by_id(session[:user_id])
  end

  def require_login
    redirect_to new_user_session_path if !(current_user)
  end
end
