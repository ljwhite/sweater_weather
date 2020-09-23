class Api::V1::RoadTripController < ApplicationController

  def create
    user = User.find_by(api_key: trip_params[:api_key])
    if user.nil?
      render json: {error: "User cannot be verified"}, status: 401
    else
      road_trip = RoadTripFacade.find_road_trip(trip_params[:origin], trip_params[:destination])
      render json: RoadTripSerializer.new(road_trip)
    end
  end

  private

  def trip_params
    params.permit(:origin, :destination, :api_key)
  end
end
