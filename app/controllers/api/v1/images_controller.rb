class Api::V1::ImagesController < ApplicationController
  respond_to :json
  before_filter :authenticate_user!

  def index
    @images = current_user.images

    @images.each do |image|
      image['url'] = image.imagefile.url
    end

    respond_with @images

  end

  def show
    respond_with Image.find(:all)
  end

  def create
    image = Image.new(image_params)
    image['url'] = image.imagefile.url
    image.user = current_user

    if image.save
      render json: image, status: :created
    else
      render json: {response: 'No Save SORRY'}
    end

  end

  private

    def image_params
      params.require(:image).permit(:imagefile)
    end

end