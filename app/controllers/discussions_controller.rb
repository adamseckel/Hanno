class DiscussionsController < ApplicationController

  def create
    @project                =   Project.find params[:project_id]
    @discussion             =   Discussion.new discussion_params
    @discussion.project     =   @project
    @discussion.user = current_user
  
    if @discussion.save
      redirect_to @project, notice: "Discussion created!"
    else
      flash.now[:alert] = "Please correct errors below"
      redirect_to @project
    end

  end

  def destroy
    @project = Project.find params[:project_id]
    @discussion = Discussion.find params[:id]

    if @discussion.destroy
      redirect_to @project, notice: "Task deleted!"
    else
      redirect_to @project, alert: "Error"
    end
  end


  def discussion_params
    params.require(:discussion).permit(:title, :description) 
  end

end
