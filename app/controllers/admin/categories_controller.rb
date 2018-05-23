class Admin::CategoriesController < Admin::BaseController

  def index
    @category = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(idea_params)
    @category.save

    redirect_to categories_path
  end
end
