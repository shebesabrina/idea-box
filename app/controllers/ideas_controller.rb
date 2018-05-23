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
    @idea = current_user.ideas.new(idea_params)

    if @idea.save
      redirect_to user_idea_path(@user, @idea)
    else
      render :new
    end
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

    redirect_to user_ideas_path(user)
  end

  private

  def set_idea
    @idea = Idea.find(params[:id])
  end

  def idea_params
    params.require(:idea).permit(:title, :description, :category_id, :user_id, :image_ids => [])
  end

end
