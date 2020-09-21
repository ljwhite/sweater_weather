class RouteDisplay

  attr_reader :location, :forecast_summary, :routes, :route_distance

  def initialize(attrs)
    @location = attrs[:location]
    @forecast_summary = attrs[:forecast_summary]
    @routes = attrs[:routes]
    @route_distance = attrs[:route_distance]
  end

  def find_distance_to_route(route)
    route_distance.fetch_values(route.name).first
  end


end
