class ForecastFacade

  def self.find_forecast(location)
    coordinates = find_coordinates(location)
    forecast = ForecastService.find_forecast(coordinates)
    result = Forecast.new(forecast).call
  end

  def self.find_coordinates(location)
    location_return = LocationService.find_coordinates(location)
    OpenStruct.new(
      lat: location_return[:results].first[:locations].first[:latLng][:lat],
      long: location_return[:results].first[:locations].first[:latLng][:lng]
    )
  end

  private_class_method :find_coordinates
end
