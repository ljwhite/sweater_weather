require 'rails_helper'

describe RoadTripFacade do
  describe 'class methods' do
    it "can generate a RoadTripPlanner PORO given an origin and destination" do
      origin = "Denver,CO"
      destination = "Pueblo,CO"
      results = RoadTripFacade.find_road_trip(origin, destination)
      expect(results.origin).to eq("Denver, CO")
      expect(results.destination).to eq("Pueblo, CO")
      expect(results.temperature).to be_an Integer
    end
    it "can format a location" do
      location = 'denver,co'
      result = RoadTripFacade.format_location(location)
      expect(result).to be_a String
      expect(result).to eq("Denver, CO")
    end
    it "can format a trip duration" do
      time = "04:33:25"
      result = RoadTripFacade.format_trip_time(time)
      expect(result).to eq("4 hours, 33 minutes")
      time = "0:25:25"
      result = RoadTripFacade.format_trip_time(time)
      expect(result).to eq("25 minutes")
      time = "1:01:25"
      result = RoadTripFacade.format_trip_time(time)
      expect(result).to eq("1 hour, 1 minute")
      time = "25:15:25"
      result = RoadTripFacade.format_trip_time(time)
      expect(result).to eq("1 day, 1 hour, 15 minutes")
      time = "55:15:25"
      result = RoadTripFacade.format_trip_time(time)
      expect(result).to eq("2 days, 7 hours, 15 minutes")
    end
  end
end
