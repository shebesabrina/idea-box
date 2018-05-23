class Admin::CategoriesController < Admin::BaseController
  before_action :set_category, only:[:edit, :destroy]
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
  end

  def destroy
    @category.destroy

    redirect_to categories_path
  end

  private

  def idea_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
