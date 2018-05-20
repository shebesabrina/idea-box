class IdeasController < ApplicationController
  def index
    @ideas = Idea.all
  end

  def new
    @idea = Idea.new
  end

  def create
    idea = Idea.create(idea_params)
    idea.save

    redirect_to ideas_path
  end

  def edit

  end

  private

  def idea_params
    params.require(:idea).permit(:title, :description, :category_id, :image_ids => [])
  end

end
