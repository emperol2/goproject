class UsersController < ApplicationController
  before_filter :login_required, :except => [:new, :create]
  before_filter :you_are_current_user, :only => :new

  def new
    @user = User.new
  end

  def show
    @user = User.find(current_user)
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      # Handle a successful save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(current_user)
  end

  def update
    @user = User.find(current_user)

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
