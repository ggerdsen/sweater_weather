class Api::V1::ForecastController < ApplicationController
  def show
    weather_data = ForecastFacade.search(search_params[:location])
    render json: weather_data
  end
  
  private
  
  def search_params
    params.permit(:location)
  end
end