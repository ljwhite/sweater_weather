require 'rails_helper'

describe RoadTripFacade do
  describe 'class methods' do
    it "format_coordinates" do
      origin = OpenStruct.new({lat: 11.11, long: 22.22})
      results = RoadTripFacade.format_coordinates(origin)
      expect(results).to eq("11.11,22.22")
    end
    it "can generate a RoadTripPlanner PORO given an origin and destination" do
      origin = "Denver,CO"
      destination = "Pueblo,CO"
      results = RoadTripFacade.find_road_trip(origin, destination)
    end
  end
end
