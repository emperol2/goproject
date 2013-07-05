class ProjectsController < ApplicationController
    
    before_filter :not_tester, :only => :edit
    before_filter :correct_user, :only => :show
    
  def index
    @projects = Project.all
  end

  def show
    
    #@project = Project.find(params[:id])
    @project = current_user.projects.find_by_id(params[:id])
    #redirect_to(current_user, :notice => 'Record not found') unless @project   
    #rescue ActiveRecord::RecordNotFound
    
    #redirect_to current_user
    #end
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])
    @project.user_id = current_user.id
    if @project.save
      redirect_to current_user, :notice => "Successfully created project."
    else
      render :action => 'new'
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      redirect_to @project, :notice  => "Successfully updated project."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_url, :notice => "Successfully destroyed project."
  end
  
  def correct_user
      @project = current_user.projects.find_by_id(params[:id])
      redirect_to(current_user, :notice => 'You are not able to access requested project') if @project.nil?
  end
end
