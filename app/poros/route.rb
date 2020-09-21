class Route

  def initialize(attrs)
    @name = attrs[:name]
    @type = attrs[:type]
    @rating = attrs[:rating]
    @location = attrs[:location]
  end
end
