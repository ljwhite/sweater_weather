class RoadTripFacade

  #take origin and destination
  #convert each to coordinates
  #string coordinates of each together
  #send formatted coordinates to LocationService
  #send origin coordinates to forecast service to get forecast
  #take forecast and road trip to PORO

  def self.find_road_trip(origin, destination)
    # origin_coordinates = LocationFacade.find_coordinates(origin)
    # destination_coordinates = LocationFacade.find_coordinates(destination)
    # format_origin = LocationFacade.format_coordinates(origin_coordinates)
    # format_dest = LocationFacade.format_coordinates(destination_coordinates)
    roadtrip = LocationFacade.find_road_trip(origin, destination)
    forecast = ForecastFacade.find_forecast(destination)
    attributes = {
      trip_time: roadtrip[:route][:formattedTime],
      temperature: forecast.current_forecast[:current_temp],
      description: forecast.current_forecast[:current_description],
      origin: RoadTripFacade.format_location(origin),
      destination: RoadTripFacade.format_location(destination)
    }
    RoadTripPlanner.new(attributes)
  end

  def self.format_location(location)
    arr = location.split(',')
    arr[0].capitalize!
    arr[1].upcase!
    arr.join(", ")
  end
  # def self.find_forecast(location)
  #   coordinates = LocationFacade.find_coordinates(location)
  #   ForecastFacade.find_forecast
  # end
end
