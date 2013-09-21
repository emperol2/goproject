class IssuesController < ApplicationController
  # GET /issues
  # GET /issues.json
  def index
    @issues = Issue.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @issues }
    end
  end

  # GET /issues/1
  # GET /issues/1.json
  def show
    @issue = Issue.find(params[:id])
    @comment = Comment.new

    if current_tester != nil
      @tester = Tester.find(current_tester)
      #@comment.tester_id = @tester.id
    elsif current_user
      @user = User.find(current_user)
      #@comment.user_id = @user.id
    end

    #@comment.issue_id = @issue.id

    @commentofissue = @issue.comments.order("created_at DESC")
    ##@commentofissue = @commentofissue.order("created_at DESC")

  end

  # GET /issues/new
  # GET /issues/new.json
  def new
    @issue = Issue.new
    @feedback = Feedback.find(params[:feedback_id])
    @tester = Tester.find(current_tester)
    @issue.tester_id = @tester.id
    @issue.feedback_id = @feedback.id


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @issue }
    end
  end

  # GET /issues/1/edit
  def edit
    @issue = Issue.find(params[:id])
  end

  # POST /issues
  # POST /issues.json
  def create
    #@feedback = Feedback.find(params[:feedback_id])
    #@issue.feedback_id = @feedback.id
    @issue = Issue.new(params[:issue])
    @tester = Tester.find(current_tester)
    @issue.tester_id = @tester.id
    @issue.approvalstatus = "Waiting for Approval"


    respond_to do |format|
      if @issue.save
        format.html { redirect_to projects_path, notice: 'Issue was successfully created.' }
        format.json { render json: @issue, status: :created, location: @issue }
      else
        format.html { render action: "new" }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /issues/1
  # PUT /issues/1.json
  def update
    @issue = Issue.find(params[:id])

    respond_to do |format|
      if @issue.update_attributes(params[:issue])
        format.html { redirect_to @issue, notice: 'Issue was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issues/1
  # DELETE /issues/1.json
  def destroy
    @issue = Issue.find(params[:id])
    @issue.destroy

    respond_to do |format|
      format.html { redirect_to issues_url }
      format.json { head :no_content }
    end
  end

  def approvalstatus
    @issue = Issue.find(params[:id])
    @tester = @issue.tester_id
    @get_feedbackID = @issue.feedback_id
    @issue.update_attributes(:approvalstatus => params[:approvalstatus])
    if @issue.approvalstatus == "Approved"
      #@issue = @issue.tester.score + 1o
      @oAssignment = Assignment.where("tester_id = ? AND feedback_id = ?", @tester, @get_feedbackID)
      @oAssignment.each do |x|
        x.score = x.score.to_i + 10.to_i
        @oAssignment.update(@oAssignment, :score => x.score)
      end

      redirect_to issue_path, notice: 'Approved'

      #@issue.tester.score = @issue.tester.score.to_i + 10.to_i
      #@issue.tester.update_attributes(:score => @issue.tester.score)
    else
      #@issue.tester.score = @issue.tester.score.to_i + 0.to_i
      #@issue.tester.update_attributes(:score => @issue.tester.score)
      @oAssignment = Assignment.where("tester_id = ? AND feedback_id = ?", @tester, @get_feedbackID)
      @oAssignment.each do |x|
        x.score = x.score.to_i + 0.to_i
        @oAssignment.update(@oAssignment, :score => x.score)
      end

      redirect_to issue_path, notice: 'Rejected'

    end




  end
end

