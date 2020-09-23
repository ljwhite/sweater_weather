class LocationFacade

  def self.find_coordinates(location)
    location_return = LocationService.find_coordinates(location)
    OpenStruct.new(
      lat: location_return[:results].first[:locations].first[:latLng][:lat],
      long: location_return[:results].first[:locations].first[:latLng][:lng]
    )
  end

  def self.format_coordinates(coordinates)
    coordinates.lat.to_s + "," + coordinates.long.to_s
  end

  def self.find_road_trip(origin, destination)
    origin_coord = LocationFacade.find_coordinates(origin)
    start = LocationFacade.format_coordinates(origin_coord)
    destination_coord = LocationFacade.find_coordinates(destination)
    final = LocationFacade.format_coordinates(destination_coord)
    LocationService.find_road_trip(start, final)
  end
end
