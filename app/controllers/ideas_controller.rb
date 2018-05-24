class IdeasController < ApplicationController
  before_action :set_idea, only: [:destroy, :edit, :update, :show]

  def index
    @user = User.find(params[:user_id])
    @ideas = @user.ideas
  end

  def new
    @user = User.find(params[:user_id])
    @idea = Idea.new
    @categories = Category.all
    @images = Image.all
  end

  def show
    @user = User.find(params[:user_id])
  end


  def create
    @user = User.find(params[:user_id])
    @idea = @user.ideas.new(idea_params)
    idea_image = @idea.idea_images.new(image_params)
    if @idea.save && idea_image.save

      redirect_to user_ideas_path(@user)
    else
      @categories = Category.all
      render :new
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @categories = Category.all
  end

  def update
    @idea.update(idea_params)

    redirect_to user_idea_path(@idea.user, @idea)
  end

  def destroy
    user = User.find(params[:user_id])
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

  def image_params
    params.require(:image).permit(:image_id)
  end

end
