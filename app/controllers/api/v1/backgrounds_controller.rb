class Api::V1::BackgroundsController < ApplicationController
  def index
    image_object = ImageFacade.find_image(background_params[:location])
    render json: BackgroundSerializer.new(image_object)
  end

  private

  def background_params
    params.permit(:location)
  end
end
