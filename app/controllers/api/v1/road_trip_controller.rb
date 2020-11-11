class Api::V1::RoadTripController < ApplicationController

  def create
    user = User.find_by(api_key: trip_plan_params[:api_key])
    start_city = trip_plan_params[:origin]
    end_city = trip_plan_params[:destination]
    trip = SearchFacade.get_info(user, start_city, end_city)
    render json: RoadTripSerializer.new(trip)
  end

  private

  def trip_plan_params
    params.permit(:origin, :destination, :api_key)
  end
end