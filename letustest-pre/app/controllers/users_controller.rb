class UsersController < ApplicationController
  before_filter :login_required, :except => [:new, :create]
  before_filter :you_are_current_user, :only => :new
  before_filter :you_are_current_tester, :only => [:new, :show]

  def new
    @user = User.new
  end

  def show
    @user = User.find_by_id(params[:id])
    if @user != current_user
      flash[:error] = "You are not allow to see other profiles."
      redirect_to current_user
    end


  end

  def create
    @user = User.new(params[:user])
    if @user.save
      # Handle a successful save
      user = @user
      session[:user_id] = user.id
      flash[:success] = "Welcome to the your dashboard !"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit

    @user = User.find(params[:id])
    if @user != current_user
      redirect_to current_user, notice: 'You are not allow to see other profiles.'
    end
  end

  def update

    @user = User.find(current_user)

    respond_to do |format|
      if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
        params[:user].delete(:password)
        params[:user].delete(:password_confirmation)
      end
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  def manage

    #@feedback = Feedback.find(params[:id])
    #if current_tester
    #  @tester = Tester.find(current_tester)
    #  @feedback.tester_id = @feedback.tester_id.to_i
    #
    #
    #  @project_score = Assignment.where("tester_id = ? AND feedback_id = ?", @tester.id, @feedback.id)
    #elsif current_user
    #  @user = User.find(current_user)
    #  @project_tester = @feedback.testers.all
    #end

    if current_user

      @user = User.find(current_user)

    end

    #if @tester == nil
    #  @user = User.find(current_user)
    #  if @feedback.user_id != @user.id
    #    redirect_to current_user, notice: 'This requested project is not belong to your account!'
    #  end
    #  #elsif @feedback.tester_id != @tester.id
    #  # redirect_to current_tester, notice: 'This requested project is not belong to your account!'
    #end

  end


end
