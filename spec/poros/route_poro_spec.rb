require 'rails_helper'

describe Route do
  describe 'instance methods' do
  it 'can initialize an object given attributes' do
      attributes =
      {
        name: "route_name",
        type: "route_type",
        rating: 5.10,
        locaton: ["Denver", "CO"],
        longitude: -104.98,
        latitude: 39.74
      }
      route = Route.new(attributes)
      expect(route.name).to eq(attributes[:name])
      expect(route.type).to eq(attributes[:type])
      expect(route.rating).to eq(attributes[:rating])
      expect(route.location).to eq(attributes[:location])
      expect(route.longitude).to eq(attributes[:longitude])
      expect(route.latitude).to eq(attributes[:latitude])
    end
  end
end
