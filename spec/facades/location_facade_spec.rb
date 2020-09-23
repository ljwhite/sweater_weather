require 'rails_helper'

describe LocationFacade do
  describe "class methods" do
    it "find_coordinates" do
      location = 'denver,co'
      result = LocationFacade.find_coordinates(location)
      expect(result.lat.round(2)).to eq(39.74)
      expect(result.long.round(2)).to eq(-104.98)
    end
    it "format_coordinates" do
      coordinates = OpenStruct.new({lat: 39.74, long: -104.98})
      result = LocationFacade.format_coordinates(coordinates)
      expect(result).to eq("39.74,-104.98")
    end
    it "find_road_trip" do
      origin = 'Denver,CO'
      destination = 'Pueblo,CO'
      result = LocationFacade.find_road_trip(origin,destination)
      expect(result).to be_a Hash
      expect(result[:route].keys).to include(:distance)
      expect(result[:route].keys).to include(:formattedTime)
      expect(result[:route][:formattedTime]).to eq("01:44:01")
      expect(result[:route][:distance]).to eq(111.517)

    end
  end
end
