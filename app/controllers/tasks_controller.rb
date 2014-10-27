class TasksController < ApplicationController

  def create
    @project          =   Project.find params[:project_id]
    @task             =   Task.new task_params
    @task.project     =   @project
  
    if @task.save
      redirect_to @project, notice: "Task created!"
    else
      flash.now[:alert] = "Please correct errors below"
      redirect_to @project
    end

  end

  def update
    @project = Project.find params[:project_id]
    @task = Task.find params[:id]
    if @task.done 
      @task.update_attributes(:done => false)
    else 
      @task.update_attributes(:done => true)
    end

    redirect_to @project

  end

  def destroy
    @project = Project.find params[:project_id]
    @task = Task.find params[:id]

    if @task.destroy
      redirect_to @project, notice: "Task deleted!"
    else
      redirect_to @project, alert: "Error"
    end
  end



  def task_params
    params.require(:task).permit(:title, :due_date) 
  end
end
