class Api::V1::TrailsController < ApplicationController
  def index
    trails_info = TrailsFacade.search(search_params[:location])
    forecast_info = ForecastFacade.search(search_params[:location])
    binding.pry
  end
  
  private
  
  def search_params
    params.permit(:location)
  end
end
