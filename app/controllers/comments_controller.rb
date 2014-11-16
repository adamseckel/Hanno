class CommentsController < ApplicationController

  def create
    # @project                =   Project.find params[:project_id]
    @discussion             =   Discussion.find params[:discussion_id]
    @project              = @discussion.project
  
    @comment             =   Comment.new comment_params
    @comment.discussion  =   @discussion
    @comment.user        =   current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @project, notice: "Discussion created!" }
        format.js { render }
      else
        format.html{ redirect_to @project, alert: "Please correct errors below" }
        format.js { render }
      end
    end

  end

  def destroy

    @discussion           =   Discussion.find params[:discussion_id]
    @project              =   @discussion.project
  
    @comment              =   Comment.find params[:id]
    @comment.discussion   =   @discussion
    respond_to do |format|

      if @comment.destroy
        format.html{redirect_to @project, notice: "Task deleted!"}
        format.js { render }
      else
        format.html{redirect_to @project, alert: "Error"}
        format.js { render }
      end
    end
  end


  def comment_params
    params.require(:comment).permit(:body) 
  end

end
