class Api::V1::ForecastController < ApplicationController
  def show
    binding.pry
    weather_data = ForecastFacade.new(search_params[:location])
    
  end
  
  private
  
  def search_params
    params.permit(:location)
  end
end