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
    @idea = Idea.new(
    title: params[:idea][:title],
    description: params[:idea][:description])
    @idea.save
    redirect_to idea_path(@idea)
  end

end
