class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_comment, :find_project

  def create
    @like = @comment.likes.new
    @like.user = current_user

    if @like.save
      redirect_to @project, notice: "Liked"
    else
      redirect_to @project, alert: "Unable to like this comment."
    end

  end

  def destroy
    @like = current_user.likes.find params[:id]
    if @like.destroy
      redirect_to @project, notice: "Un-liked"
    else
      redirect_to @project, alert: "Unable to un-like this comment."
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
