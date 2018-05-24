class Admin::ImagesController < Admin::BaseController

  def new
    @image = Image.new
  end

  def create
    @image = Image.create(image_params)
    @image.save
    redirect_to images_path
  end

  private

  def image_params
    params.require(:image).permit(:name, :url)
  end
end
