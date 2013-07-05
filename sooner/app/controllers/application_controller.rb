class ApplicationController < ActionController::Base
  #after_filter :require_login
  include ControllerAuthentication
  protect_from_forgery




  #private

  # def require_login
  #  if request.referer == "http://localhost:3000/testers/1"
  #   flash[:error] = "NO"
  #  end
  #  end
end
