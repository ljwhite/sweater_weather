class RoadTripSerializer
  include FastJsonapi::ObjectSerializer

  attributes :origin, :destination, :time, :temperature, :description
end
