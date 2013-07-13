class SessionsController < ApplicationController

  def create
    user = User.find_by_name(params[:session][:name])
    tester = Tester.find_by_fname(params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to current_user, notice: "Logged in!"
    elsif tester && tester.authenticate(params[:session][:password])
      session[:tester_id] = tester.id
      redirect_to current_tester, notice: "Logged in!"  
    else
      flash[:error] = "Wrong Username or Password."
      redirect_to signin_path
    end
  end

  def new

  end

  def destroy
    session[:user_id] = nil
    session[:tester_id] = nil
    redirect_to root_url, notice: "Logged out."
  end
end
