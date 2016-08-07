class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authenticate_user!
    redirect_to '/login' unless current_user
  end

  def current_bartender
    @current_bartender ||= Bartender.find_by(id: session[:bartender_id]) if session[:bartender_id]
  end
  helper_method :current_bartender

  def authenticate_bartender!
    redirect_to '/bartender_login' unless current_bartender
  end
end
