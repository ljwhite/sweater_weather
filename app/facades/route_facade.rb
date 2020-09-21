class RouteFacade

  def self.find_routes(location)
    coordinates = LocationFacade.find_coordinates(location)
    forecast = ForecastService.find_forecast(coordinates)
    routes = RouteService.find_routes(coordinates)
  end
end
