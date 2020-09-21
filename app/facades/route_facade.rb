class RouteFacade

  def self.find_routes(location)
    coordinates = LocationFacade.find_coordinates(location)
    # forecast = ForecastService.find_forecast(coordinates)
    forecast = ForecastFacade.find_forecast(location)
    routes = RouteService.find_routes(coordinates)
    forecast_summary = ForecastSummary.new(forecast)

    # distance = LocationService.find_distance(coordinates, destination)
    route_objects = routes[:routes].map do |route|
      Route.new(route)
    end
    distance = Hash.new
    route_objects.each do |route|
      origin = coordinates.lat.to_s + "," + coordinates.long.to_s
      destination = route.latitude.to_s + "," + route.longitude.to_s
      distance[route.name] = LocationFacade.find_distance(origin, destination)
    end
    OpenStruct.new(
      location: location,
      forecast_summary: forecast_summary,
      routes: route_objects,
      route_distance: distance
    )
    # [location, forecast_summary, route_objects, distance]
  end
end
