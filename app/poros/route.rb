class Route

  attr_reader :name, :type, :rating, :location, :longitude, :latitude

  def initialize(attrs)
    @name = attrs[:name]
    @type = attrs[:type]
    @rating = attrs[:rating]
    @location = attrs[:location]
    @longitude = attrs[:longitude]
    @latitude = attrs[:latitude]
  end

  def self.find_coordinates_of_route_objects
    self.map do |route_object|
      OpenStruct.new(
        lat: route_object.latitude,
        long: route_object.longitude
      )
    end
  end
end
