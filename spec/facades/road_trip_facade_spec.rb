require 'rails_helper'

describe RoadTripFacade do
  describe 'class methods' do
    it "can generate a RoadTripPlanner PORO given an origin and destination" do
      origin = "Denver,CO"
      destination = "Pueblo,CO"
      results = RoadTripFacade.find_road_trip(origin, destination)
    end
    it "can format a location" do
      location = 'denver,co'
      result = RoadTripFacade.format_location(location)
      expect(result).to be_a String
      expect(result).to eq("Denver, CO")
    end
  end
end
