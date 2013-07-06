class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user
  end

  def login_required
    unless logged_in?
      store_target_location
      redirect_to root_url, :alert => "You must first log in or sign up before accessing this page."
    end
  end

  def you_are_current_user
    if current_user
      store_target_location
      redirect_to root_url, :alert => "You are not allow to access this page after logged in."
    end
  end

  def store_target_location
    session[:return_to] = request.url
  end

  helper_method :current_user
end
