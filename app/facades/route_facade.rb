class RouteFacade

  def self.find_routes(location)
    coordinates = LocationFacade.find_coordinates(location)
    forecast = ForecastService.find_forecast(coordinates)
    routes = RouteService.find_routes(coordinates)
    route_objects = routes[:routes].map do |route|
      Route.new(route)
    end
    [location, coordinates, forecast, route_objects]
  end
end
