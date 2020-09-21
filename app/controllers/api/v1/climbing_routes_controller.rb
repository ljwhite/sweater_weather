class Api::V1::ClimbingRoutesController < ApplicationController

  def index
    summary_object = RouteFacade.find_routes(route_params[:location])
    render json: ClimbingRouteSerializer.summary(summary_object)
  end

  private
  def route_params
    params.permit(:location)
  end
end
