class Api::V1::BackgroundsController < ApplicationController

  def index
    backgrounds = SearchFacade.search_backgrounds(backgrounds_params[:location])
    render json: ImageSerializer.new(backgrounds)
  end
  
  private
  
  def backgrounds_params
    params.permit(:location)
  end

end