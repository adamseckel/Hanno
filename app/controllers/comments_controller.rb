class CommentsController < ApplicationController

  def create
    # @project                =   Project.find params[:project_id]
    @discussion             =   Discussion.find params[:discussion_id]
    @project = @discussion.project
  
    @comment             =   Comment.new comment_params
    @comment.discussion  =   @discussion

  
    if @comment.save
      redirect_to @project, notice: "Discussion created!"
    else
      flash.now[:alert] = "Please correct errors below"
      redirect_to @project
    end

  end

  def destroy

    @discussion           =   Discussion.find params[:discussion_id]
    @project              = @discussion.project
  
    @comment              =   Comment.find params[:id]
    @comment.discussion   =   @discussion


    if @comment.destroy
      redirect_to @project, notice: "Task deleted!"
    else
      redirect_to @project, alert: "Error"
    end
  end


  def comment_params
    params.require(:comment).permit(:body) 
  end

end
