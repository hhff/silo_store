class Api::V1::ImagesController < ApplicationController
  def create
    image = Image.new(image_params)

    if image.save
      render json: {response: 'SUP IM HERE BRO!!!!'}
    else
      render json: {response: 'No Save SORRY'}
    end

  end

  private

    def image_params
      params.require(:image).permit(:type, :imagefile)
    end
end
