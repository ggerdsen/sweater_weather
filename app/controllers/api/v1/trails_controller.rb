class Api::V1::TrailsController < ApplicationController
  def index
      # location = search_params[:location]
    trails_info = TrailsFacade.search(search_params[:location])

  end
  
  private
  
  def search_params
    params.permit(:location)
  end
end
