class Api::V1::ForecastController < ApplicationController
  def show
    weather_data = SearchFacade.search_forecast(search_params[:location])
    render json: ForecastSerializer.new(weather_data)
  end
  
  private
  
  def search_params
    params.permit(:location)
  end
end