class LocationFacade

  def self.find_coordinates(location)
    location_return = LocationService.find_coordinates(location)
    OpenStruct.new(
      lat: location_return[:results].first[:locations].first[:latLng][:lat],
      long: location_return[:results].first[:locations].first[:latLng][:lng]
    )
  end
end
