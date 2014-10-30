class ProjectsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def index
    @project = Project.new 
    @projects = Project.recent
  end

  def create
    @project = Project.new project_params
    @project.user = current_user
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

  def edit
    @project = Project.find params[:id]
  end

  def update
    @project = Project.find params[:id]
    if @project.update project_params
      redirect_to @project, notice: "Updated successfully!"
    else
      flash.now[:alert] = "Please correct errors below!"
      render :edit
    end
  end

  def destroy
    @project = Project.find params[:id]
    if @project.destroy
      redirect_to projects_path
    else
      flash.now[:alert] = "Error"
      redirect_to @project
    end
    

  end


  private

  def project_params
    params.require(:project).permit(:title, :description, :due_date)
  end


end
