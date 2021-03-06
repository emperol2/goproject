class TestersController < ApplicationController
  before_filter :login_required, :except => [:new, :create, :becometester]
  before_filter :you_are_current_tester, :only => :new
  before_filter :you_are_current_user, :only => [:new, :show]
  # GET /testers
  # GET /testers.json
  def index
    @testers = Tester.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @testers }
    end
  end

  # GET /testers/1
  # GET /testers/1.json
  def show
    @tester = Tester.find(params[:id])
    
    if @tester != current_tester
      redirect_to current_tester, notice: 'You are not allow to see other profiles.'
    end
    
    #redirect_to current_tester, notice: 'You are not allow to see other profiles.'

    #respond_to do |format|
    #  format.html # show.html.erb
    #  format.json { render json: @tester }
    #end
  end

  # GET /testers/new
  # GET /testers/new.json
  def new
    @tester = Tester.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tester }
    end
  end

  # GET /testers/1/edit
  def edit
    @tester = Tester.find(params[:id])
  end

  # POST /testers
  # POST /testers.json
  def create
    @tester = Tester.new(params[:tester])
    

    respond_to do |format|
      if @tester.save
        tester = @tester
        session[:tester_id] = tester.id
        format.html { redirect_to @tester, notice: 'Tester was successfully created.' }
        format.json { render json: @tester, status: :created, location: @tester }
      else
        format.html { render action: "new" }
        format.json { render json: @tester.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /testers/1
  # PUT /testers/1.json
  def update
    @tester = Tester.find(params[:id])

    respond_to do |format|
      if @tester.update_attributes(params[:tester])
        format.html { redirect_to @tester, notice: 'Tester was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tester.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /testers/1
  # DELETE /testers/1.json
  def destroy
    @tester = Tester.find(params[:id])
    @tester.destroy

    respond_to do |format|
      format.html { redirect_to testers_url }
      format.json { head :no_content }
    end
  end
  
  def becometester
    
  end
  
  def projects
    @tester = Tester.find(current_tester)
    
    if @tester != current_tester
      redirect_to current_tester, notice: 'You are not allow to see other profiles.'
    end
    @checknbofproject = Assignment.where(tester_id: @tester.id)
    
    @feedback = Feedback.where(status: "successful")

    
  end

  def assigned
    @feedback = Feedback.find(params[:assigned])
    @assign = Assignment.new
    #@assign.save
    @tester = Tester.find(current_tester)
    @feedback = Feedback.find(params[:assigned])
    #@assign = Assignment.new
    @assign.feedback_id = @feedback.id
    @assign.tester_id = @tester.id
    @feedback.avai_tester = @feedback.nboftester.to_i

    @feedback.avai_tester = @feedback.avai_tester.to_i - 1.to_i
    @feedback.update_attributes(:avai_tester => @feedback.avai_tester)

    if @assign.save
      redirect_to current_tester, notice: 'You are assigned to project.'
    else
      redirect_to current_tester, notice: 'FAILED'
    end





    #@assignment1 = Feedback.new(params[:feedback_id])
    #@assignment2 = @assignment1.assignments.build(:tester_id => @tester.id)
    #@assignment2.save


  end
  
end
