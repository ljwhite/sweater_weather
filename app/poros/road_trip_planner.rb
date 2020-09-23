class RoadTripPlanner

  attr_reader :time, :temperature, :description, :origin, :destination, :id

  def initialize(attrs)
    @time = attrs[:trip_time]
    @temperature = attrs[:temperature]
    @description = attrs[:description]
    @origin = attrs[:origin]
    @destination = attrs[:destination]
    @id = nil
  end
end
