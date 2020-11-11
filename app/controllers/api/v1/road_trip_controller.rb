class Api::V1::RoadTripController < ApplicationController

  def create

  end

  private

  def trip_plan_params
    params.permit(:start_city, :end_city, :api_key)
  end
end