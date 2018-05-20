class IdeasController < ApplicationController
  before_action :set_idea, only: [:destroy, :edit, :update, :show]

  def index
    @ideas = Idea.all

  end

  def new
    @idea = Idea.new
    @categories = Category.all
  end

  def show

  end

  def create
    idea = Idea.create(idea_params)

    idea.save

    redirect_to ideas_path
  end

  def edit
    @categories = Category.all
  end

  def update
    @idea.update(idea_params)

    redirect_to idea_path(@idea)
  end

  def destroy
    @idea.destroy

    redirect_to ideas_path
  end

  private

  def set_idea
    @idea = Idea.find(params[:id])
  end

  def idea_params
    params.require(:idea).permit(:title, :description, :category_id, :image_ids => [])
  end

end
