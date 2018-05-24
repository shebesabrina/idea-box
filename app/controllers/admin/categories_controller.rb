class Admin::CategoriesController < Admin::BaseController
  before_action :set_category, only:[:edit, :destroy, :update]

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(params[:id])
    @category.save

    redirect_to categories_path
  end

  def edit
  end

  def destroy
    @category.destroy

    redirect_to categories_path
  end

  def update
    @category.update(category_params)
    redirect_to category_path(@category)
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
