class RouteFacade

  def self.find_routes(location)
    coordinates = LocationFacade.find_coordinates(location)
    forecast_summary = self.find_forecast(location)
    route_objects = self.find_route_data(coordinates)
    distance = self.find_distance(coordinates, route_objects)
    attributes =
    {
      location: location,
      forecast_summary: forecast_summary,
      routes: route_objects,
      route_distance: distance
    }
    RouteDisplay.new(attributes)
  end

  def self.find_route_data(coordinates)
    routes = RouteService.find_routes(coordinates)
    route_objects = routes[:routes].map do |route|
      Route.new(route)
    end
  end

  def self.find_distance(coordinates, route_objects)
    distance = Hash.new
    route_objects.each do |route|
      origin = coordinates.lat.to_s + "," + coordinates.long.to_s
      destination = route.latitude.to_s + "," + route.longitude.to_s
      distance[route.name] = LocationFacade.find_distance(origin, destination)
    end
    distance
  end

  def self.find_forecast(location)
    forecast = ForecastFacade.find_forecast(location)
    ForecastSummary.new(forecast)
  end
end
