class Admin::CategoriesController < Admin::BaseController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(idea_params)
    @category.save

    redirect_to categories_path
  end

  def edit
    @category = Category.find(params[:id])
  end

  private

  def idea_params
    params.require(:category).permit(:name)
  end
end
