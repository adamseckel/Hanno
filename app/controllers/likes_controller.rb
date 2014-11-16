class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_comment, :find_project

  def create
    @like = @comment.likes.new
    @like.user = current_user
    respond_to do |format|    
      if @like.save
        format.html{redirect_to @project, notice: "Liked"}
        format.js {render}
      else
        format.html{redirect_to @project, alert: "Unable to like this comment."}
        format.js {render}
      end
    end

  end

  def destroy
    @like = current_user.likes.find params[:id]
    respond_to do |format|
      if @like.destroy
        format.html{redirect_to @project, notice: "Un-liked"}
        format.js {render}
      else
        format.html{redirect_to @project, alert: "Unable to un-like this comment."}
        format.js {render}
      end
    end
    
  end

  private

  def find_comment
    @comment = Comment.find params[:comment_id]
  end

  def find_project
    @project = @comment.discussion.project
  end


end
