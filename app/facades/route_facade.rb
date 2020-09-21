class RouteFacade

  def self.find_routes(location)
    coordinates = LocationFacade.find_coordinates(location)
    forecast = ForecastService.find_forecast(coordinates)
    routes = RouteService.find_routes(coordinates)
    route_objects = routes.each do |route|
      Route.new(route)
    [location, coordinates, forecast, routes]
  end
end
