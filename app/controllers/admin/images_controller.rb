class Admin::ImagesController < Admin::BaseController

  def new
    @image = Image.new
  end

  def create
    @image = Image.create(image_params)
    @image.save
    redirect_to images_path
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    image = Image.find(params[:id])
    if image.update(image_params)
      redirect_to admin_images_path
    else
      redirect_to edit_admin_image_path(image)
    end
  end

  def destroy
    image = Image.find(params[:id])
    image.destroy
    redirect_to admin_images_path
  end

  private

  def image_params
    params.require(:image).permit(:name, :url)
  end
end
