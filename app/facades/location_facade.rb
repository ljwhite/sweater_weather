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
end
