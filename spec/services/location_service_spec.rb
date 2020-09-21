require 'rails_helper'

describe LocationService do
  describe 'class methods' do
    it "returns location data" do
      service = LocationService
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
    it "can find distance between two locations" do
      origin = '40.03,-105.25'
      destination = '40.03,-106.25'
      search = LocationService.find_distance(origin, destination)
      expect(search[:route].keys).to include(:distance)
      expect(search[:route][:distance]).to eq(122.267)
    end
  end
end
