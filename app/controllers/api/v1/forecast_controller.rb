class Api::V1::ForecastController < ApplicationController
  def index
    forecast_object = ForecastFacade.find_forecast(forecast_params[:location])
    render json: ForecastSerializer.forecast(forecast_object).to_json
  end

  private

  def forecast_params
    params.permit(:location)
  end
end
