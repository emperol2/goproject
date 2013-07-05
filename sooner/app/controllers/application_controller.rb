class ApplicationController < ActionController::Base
  include ControllerAuthentication
  protect_from_forgery
  
  
  def not_tester
     #if request.referer != "sooner.nuttaponp.c9.io/tester/1" 
     redirect_to '/testers' unless request.fullpath == '/projects/1/edit'
     #end
  end
  
end
