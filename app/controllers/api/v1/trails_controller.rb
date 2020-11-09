class Api::V1::TrailsController < ApplicationController
  def index
    trails_info = TrailsFacade.search(search_params[:location])
    forecast_info = ForecastFacade.search(search_params[:location])
    
    map_info = DirectionsFacade.search(search_params[:location], trails_info, forecast_info.current_weather)
    binding.pry
    
  end
  
  private
  
  def search_params
    params.permit(:location)
  end
end
