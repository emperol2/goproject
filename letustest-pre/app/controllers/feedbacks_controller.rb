class FeedbacksController < ApplicationController
  before_filter :login_required
  before_filter :you_are_current_tester, :only => :new

  # GET /feedbacks
  # GET /feedbacks.json
  def index
    @feedbacks = Feedback.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @feedbacks }
    end
  end

  # GET /feedbacks/1
  # GET /feedbacks/1.json
  def show
    @feedback = Feedback.find(params[:id])
    if current_tester
      @tester = Tester.find(current_tester)
      @feedback.tester_id = @feedback.tester_id.to_i
    elsif current_user
      @user = User.find(current_user)
    end

    if @tester == nil
      @user = User.find(current_user)
      if @feedback.user_id != @user.id
        redirect_to current_user, notice: 'This requested project is not belong to your account!'
      end
    #elsif @feedback.tester_id != @tester.id
     # redirect_to current_tester, notice: 'This requested project is not belong to your account!'
    end
    #@findallissue = @feedback.issues.all

  end

  # GET /feedbacks/new
  # GET /feedbacks/new.json
  def new
    @user = User.find(current_user)
    @feedback = Feedback.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @feedback }
    end
  end

  # GET /feedbacks/1/edit
  def edit
    @user = User.find(current_user)
    @feedback = Feedback.find(params[:id])
    if @feedback.user_id != @user.id
      redirect_to current_user, notice: 'This project is not belong to your account!'
    end
  end

  # POST /feedbacks
  # POST /feedbacks.json
  def create
    @user = User.find(current_user)
    @feedback = Feedback.new(params[:feedback])
    @feedback.user_id = current_user.id
    @feedback.status = "pending"

    respond_to do |format|
      if @feedback.save
        format.html { redirect_to @feedback, notice: 'Feedback was successfully created.' }
        format.json { render json: @feedback, status: :created, location: @feedback }
      else
        format.html { render action: "new" }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /feedbacks/1
  # PUT /feedbacks/1.json
  def update
    @user = User.find(current_user)
    @feedback = Feedback.find(params[:id])

    respond_to do |format|
      if @feedback.update_attributes(params[:feedback])
        format.html { redirect_to @feedback, notice: 'Feedback was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feedbacks/1
  # DELETE /feedbacks/1.json
  def destroy
    @feedback = Feedback.find(params[:id])
    @feedback.destroy

    respond_to do |format|
      format.html { redirect_to feedbacks_url }
      format.json { head :no_content }
    end
  end
  
  def status
    @user = User.find(current_user)
    @feedback = Feedback.find(params[:id])
    @feedback.update_attributes(:status => params[:status])

    redirect_to @user, notice: 'Feedback was suc  cessfully Paid by (OFFLINE PAYMENT).'
    
  end
  
  def showall
    
    if current_user == nil
      @tester = Tester.find(current_tester)
    else
      @user = User.find(current_user)
    end
    @feedback = Feedback.find(params[:id])
    @issue = @feedback.issues.all
    #@comment_count = Issues
    #@feedback = Feedback.find(params[:id])
    #@issue.each do |counting|
      #@aa = counting.comments
      #counting = counting.id
      #@comment_count = counting.comments.count
    #end
  end
  
  def mybug
    
    if current_user == nil
      @tester = Tester.find(current_tester)
    else
      @user = User.find(current_user)
    end
    @feedback = Feedback.find(params[:id])
    @issue = @feedback.issues.where(tester_id: @tester.id)
    #@issue = @feedback.issues.where(tester_id: @tester.id)
    #@feedback = Feedback.find(params[:id])
  end
  

end
