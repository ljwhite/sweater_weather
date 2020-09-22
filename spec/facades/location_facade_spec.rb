require 'rails_helper'

describe LocationFacade do
  describe 'class methods' do
    it "can find coordinates given a location" do
      location = "denver,co"
      coordinates = LocationFacade.find_coordinates(location)
      expect(coordinates).to be_an OpenStruct
      expect(coordinates.lat).to be_a Float
      expect(coordinates.lat.round(2)).to eq(39.74)
      expect(coordinates.long).to be_a Float
      expect(coordinates.long.round(2)).to eq(-104.98)
    end
    it "can find distance between two objects" do
      origin = "39.74,-104.98"
      destination = "39.74,-105.98"
      distance = LocationFacade.find_distance(origin, destination)
      expect(distance).to be_a Float
      expect(distance.round(2)).to eq(74.38)
    end
  end
end
