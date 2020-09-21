class LocationFacade

  def self.find_coordinates(location)
    location_return = LocationService.find_coordinates(location)
    OpenStruct.new(
      lat: location_return[:results].first[:locations].first[:latLng][:lat],
      long: location_return[:results].first[:locations].first[:latLng][:lng]
    )
  end

  def self.find_distance(origin, destination)
    distance_return = LocationService.find_distance(origin, destination)
    OpenStruct.new(
      distance: distance_return[:route][:distance]
    )
  end
end
