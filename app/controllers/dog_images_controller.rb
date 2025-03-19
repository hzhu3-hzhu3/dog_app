class DogImagesController < ApplicationController
  def index
    @dog_images = DogImage.all
  end

  def show
    @dog_image = DogImage.find(params[:id])
  end
end
