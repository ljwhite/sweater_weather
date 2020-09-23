class RoadTripFacade

  #take origin and destination
  #convert each to coordinates
  #string coordinates of each together
  #send formatted coordinates to LocationService
  #send origin coordinates to forecast service to get forecast
  #take forecast and road trip to PORO

  def self.find_road_trip(origin, destination)
    origin_coordinates = LocationFacade.find_coordinates(origin)
    destination_coordinates = LocationFacade.find_coordinates(destination)
    format_origin = LocationFacade.format_coordinates(origin_coordinates)
    format_dest = LocationFacade.format_coordinates(destination_coordinates)
    roadtrip = LocationService.find_road_trip(format_origin, format_dest)
    forecast = ForecastService.find_forecast(destination_coordinates)
    RoadTripPlanner.new(roadtrip, forecast)
  end
end
