require 'rails_helper'

describe LocationService do
  describe 'class methods' do
    it "returns location data" do
      location = 'Denver,CO'
      search = LocationService.find_coordinates(location)
      expect(search).to be_a Hash
      expect(search).to have_key :results
      expect(search[:results]).to be_an Array
      expect(search[:results].first).to be_a Hash
      expect(search[:results].first).to have_key :locations
      expect(search[:results].first[:locations].first[:latLng]).to be_a Hash
    end

    it "should perform a successful search" do
      location = "Denver,CO"
      expected_attributes = [:lat, :lng]
      search = LocationService.find_coordinates(location)
      expected_attributes.each do |attribute|
        expect(search[:results].first[:locations].first[:latLng]).to have_key(attribute)
      end
    end

    it "can find directions between two given locations" do
      origin = "39.74,-104.99"
      destination = "38.25,-104.61"
      search = LocationService.find_road_trip(origin, destination)
      expect(search).to be_a Hash
      expect(search[:route].keys).to include(:formattedTime)
      expect(search[:route][:formattedTime]).to be_a String
      expect(search[:route][:formattedTime]).to eq("01:46:19")
    end
  end
end
