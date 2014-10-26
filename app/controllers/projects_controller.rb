class ProjectsController < ApplicationController

  def index
    @project = Project.new 
    @projects = Project.recent
  end

  def create
    @project = Project.new project_params
    if @project.save
      # flash[:notice] = "project saved successfully!"
      # # redirect_to question_path(@project)
      redirect_to @project
    else
      # flash.now[:alert] = "Please correct errors below"
      redirect_to root_path
    end
  end
  def show
    @project = Project.find params[:id]
    @task = Task.new
    @discussion = Discussion.new
    @comment = Comment.new

  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :due_date)
  end


end
