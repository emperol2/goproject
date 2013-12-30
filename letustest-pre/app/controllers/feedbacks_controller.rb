class FeedbacksController < ApplicationController
  before_filter :login_required
  before_filter :you_are_current_tester, :only => :new
  before_filter :check_for_cancel, :only => [:create, :update]


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

      @project_score = Assignment.where("tester_id = ? AND feedback_id = ?", @tester.id, @feedback.id)

    elsif current_user
      @user = User.find(current_user)
      @project_tester = @feedback.testers.all
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
    @feedback.status = "active"
    @feedback.project_type = "public"

    respond_to do |format|
      if @feedback.save

        @user = User.find(current_user)
        @feedbackobj = Feedback.find_last_by_user_id(@user.id)
        #@idx = Feedback.where("feedback_id = ? AND user_id = ?", @feedbackobj.id, @user.id)
        format.html { redirect_to manage_feedback_path(@feedbackobj.id), :flash => { :success => "Your challenge was added successfully" } }#, notice: 'Feedback was successfully created.' }
        format.json { render json: manage_feedback_path, status: :created, location: manage_feedback_path }

        #format.html { redirect_to manage_feedback_path, notice: 'Feedback was successfully created.' }
        #format.json { render json: manage_feedback_path, status: :created, location: manage_feedback_path }
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

    redirect_to @user, notice: 'Feedback was successfully Paid by (OFFLINE PAYMENT).'

  end

  def showall

    if current_user == nil
      @tester = Tester.find(current_tester)
    else
      @user = User.find(current_user)
    end


    #if Feedback.find(params[:id]) == nil
    #  @feedback = Feedback.find(params[:id])
    #  @issue = @feedback.issues.order("created_at DESC")
    #
    #else

    @feedback = Feedback.find(params[:id])
    @bug = @feedback.issues.where(:issue_type => 'Bug').count
    @improvement = @feedback.issues.where(:issue_type => 'Improvement').count
    @question = @feedback.issues.where(:issue_type => 'Question').count
    @others = @feedback.issues.where(:issue_type => 'Others').count

    severity_type = params[:severity]

    if severity_type == 'High'
      @feedback = Feedback.find(params[:id])
      @high_priority = @feedback.issues.where(:priority => 'high').order("created_at DESC")
      @issue = @high_priority
      @open_issue_count = @feedback.issues.order("created_at DESC")
      @rejected_issues = @feedback.issues.where(:approvalstatus => 'Rejected').order("created_at DESC")
      @tab = 'High'


    elsif severity_type == 'Medium'
      @medium_priority = @feedback.issues.where(:priority => 'medium').order("created_at DESC")
      @issue = @medium_priority
      @open_issue_count = @feedback.issues.order("created_at DESC")
      @rejected_issues = @feedback.issues.where(:approvalstatus => 'Rejected').order("created_at DESC")
      @tab = 'Medium'


    elsif severity_type == 'Low'
      @low_priority = @feedback.issues.where(:priority => 'low').order("created_at DESC")
      @issue = @low_priority
      @open_issue_count = @feedback.issues.order("created_at DESC")
      @rejected_issues = @feedback.issues.where(:approvalstatus => 'Rejected').order("created_at DESC")
      @tab = 'Low'


    else
      @feedback = Feedback.find(params[:id])
      @open_issue_count = @feedback.issues.order("created_at DESC")
      @issue = @feedback.issues.order("created_at DESC")
      @rejected_issues = @feedback.issues.where(:approvalstatus => 'Rejected').order("created_at DESC")
      @approved_issues = @feedback.issues.where(:approvalstatus => 'Approved').order("created_at DESC")
      @feedback_issue = @feedback.issues.where('title LIKE ? OR description LIKE ?', "%#{@query}%", "%#{@query}%"  )


    end

    rejected = params[:status]
    if rejected == 'rejected'
      @feedback = Feedback.find(params[:id])
      @rejected_issues = @feedback.issues.where(:approvalstatus => 'Rejected').order("created_at DESC")
      @issue = @rejected_issues
      @reject_tab = rejected

    end

    approved = params[:status]
    if approved == 'approved'
      @feedback = Feedback.find(params[:id])
      @approved_issues = @feedback.issues.where(:approvalstatus => 'Approved').order("created_at DESC")
      @issue = @approved_issues
      @approved_tab = approved


    end


    #end

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

  def description

    @user = User.find(current_user)
    @feedback = Feedback.find(params[:id])

    #@feedback.update_attributes(params[:feedback])



  end

  def rule

    @user = User.find(current_user)
    @feedback = Feedback.find(params[:id])
    @categories = Feedback.find(1,2,3).map(&:name)


    #@feedback.update_attributes(params[:feedback])

  end

  def manage

    @feedback = Feedback.find(params[:id])
    if current_tester
      @tester = Tester.find(current_tester)
      @feedback.tester_id = @feedback.tester_id.to_i


      @project_score = Assignment.where("tester_id = ? AND feedback_id = ?", @tester.id, @feedback.id)
    elsif current_user
      @user = User.find(current_user)
      @project_tester = @feedback.testers.all
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

  def testers

    @feedback = Feedback.find(params[:id])
    if current_tester
      @tester = Tester.find(current_tester)
      @feedback.tester_id = @feedback.tester_id.to_i


      @project_score = Assignment.where("tester_id = ? AND feedback_id = ?", @tester.id, @feedback.id)
      @project_tester = @feedback.testers.all
    elsif current_user
      @user = User.find(current_user)
      @project_tester = @feedback.testers.all
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

  def description2

    @user = User.find(current_user)
    @feedback = Feedback.find(params[:id])

    #@feedback.update_attributes(params[:feedback])



  end

  def check_for_cancel
    if params[:commit] == 'Cancel'
      @feedback = Feedback.find(params[:id])
      redirect_to manage_feedback_path(@feedback.id)

    end

  end

  def seetesters

    @feedback = Feedback.find(params[:id])
    if current_tester
      @tester = Tester.find(current_tester)
      @feedback.tester_id = @feedback.tester_id.to_i


      @project_score = Assignment.where("tester_id = ? AND feedback_id = ?", @tester.id, @feedback.id)
      @project_tester = @feedback.testers.all
    elsif current_user
      @user = User.find(current_user)
      @project_tester = @feedback.testers.all
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

  def promote

    @user = User.find(current_user)
    @feedback = Feedback.find(params[:id])

    #@feedback.update_attributes(params[:feedback])



  end

  def contact

    @user = User.find(current_user)
    @feedback = Feedback.find(params[:id])

    #@feedback.update_attributes(params[:feedback])



  end

  def search
    find = params[:commit]
    @query = params[:query]

    if find == 'Find'
      @feedback = Feedback.find(params[:id])
      @feedback_issue = @feedback.issues.where('title LIKE ? OR description LIKE ?', "%#{@query}%", "%#{@query}%")
    end

    @open_issue_count = @feedback.issues.order("created_at DESC")
    @rejected_issues = @feedback.issues.where(:approvalstatus => 'Rejected').order("created_at DESC")
    @approved_issues = @feedback.issues.where(:approvalstatus => 'Approved').order("created_at DESC")
    @feedback_issue = @feedback.issues.where('title LIKE ? OR description LIKE ?', "%#{@query}%", "%#{@query}%")
  end


end

