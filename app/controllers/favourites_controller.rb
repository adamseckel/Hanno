class FavouritesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_project

  def create
    @favourite = @project.favourites.new
    @favourite.user = current_user
    if @favourite.save
      redirect_to @project, notice: "Favourited."
    else
      redirect_to @project, alert: "Project could not be favourited."
    end

  end

  def destroy
    # binding.pry
    @favourite = current_user.favourite
    if @favourite.destroy
      redirect_to @project, notice: "Favourite removed."
    else
      redirect_to @project, alert: "Favourite could not be removed."
    end

  end

  private
  def find_project
    # binding.pry
    @project = Project.find params[:project_id]

  end

  
end
