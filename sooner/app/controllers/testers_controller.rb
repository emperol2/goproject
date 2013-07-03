class TestersController < ApplicationController
  def index
    @testers = Tester.all
  end

  def show
    @tester = Tester.find(params[:id])
    @project = Project.all
  end

  def new
    @tester = Tester.new
  end

  def create
    @tester = Tester.new(params[:tester], :project_id => params[:project_id])
    if @tester.save
      redirect_to @tester, :notice => "Successfully created tester."
    else
      render :action => 'new'
    end
  end

  def edit
    @tester = Tester.find(params[:id])
  end

  def update
    @tester = Tester.find(params[:id])
    if @tester.update_attributes(params[:tester])
      redirect_to @tester, :notice  => "Successfully updated tester."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @tester = Tester.find(params[:id])
    @tester.destroy
    redirect_to testers_url, :notice => "Successfully destroyed tester."
  end
end
