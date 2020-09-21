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
end
