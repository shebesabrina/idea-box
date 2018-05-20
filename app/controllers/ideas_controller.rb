class IdeasController < ApplicationController

  def index
    @ideas = Idea.all
  end

  def new
    @idea = Idea.new
  end

  def show
    @idea = Idea.find(params[:id])
  end

  def create
    idea = Idea.create(idea_params)
    binding.pry
    redirect_to idea_path(idea)
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :description)
  end
end
