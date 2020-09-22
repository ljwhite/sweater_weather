require 'rails_helper'

describe RouteFacade do
  describe 'class methods' do
    it "can find routes given a location" do
      location = "erwin,tn"
      result = RouteFacade.find_routes(location)
      expect(result).to be_an RouteDisplay
      expect(result.forecast_summary).to be_a ForecastSummary
      expect(result.forecast_summary.summary).to be_a String
      expect(result.forecast_summary.temperature).to be_an Integer
      expect(result.location).to be_a String
      expect(result.location).to eq(location)
      expect(result.route_distance).to be_a Hash
      expect(result.route_distance.values.sample).to be_a Float
      expect(result.routes).to be_an Array
      expect(result.routes.count).to eq(5)
      expect(result.routes[0]).to be_a Route
      expect(result.routes[0].latitude).to be_a Float
      expect(result.routes[0].longitude).to be_a Float
      expect(result.routes[0].name).to be_a String
      expect(result.routes[0].rating).to be_a String
      expect(result.routes[0].type).to be_a String
    end
    it "can provide route data" do
      coordinates = OpenStruct.new(lat: 39.74, long: -104.99)
      route_objects = RouteFacade.find_route_data(coordinates)
      expect(route_objects).to be_an Array
      expect(route_objects.count).to eq(5)
      expect(route_objects[0]).to be_a Route
    end
    it "can find distance" do
      coordinates = OpenStruct.new(lat: 39.74, long: -104.99)
      route_objects = RouteFacade.find_route_data(coordinates)
      distances = RouteFacade.find_distance(coordinates, route_objects)
      expect(distances).to be_a Hash
      expect(distances.count).to eq(5)
      expect(distances.values.sample).to be_a Float
      expect(distances.keys.sample).to be_a String
    end
    it "can find forecast summary" do
      location = 'denver,co'
      forecast_summary = RouteFacade.find_forecast(location)
      expect(forecast_summary).to be_a ForecastSummary
      expect(forecast_summary.summary).to be_a String
      expect(forecast_summary.temperature).to be_a Integer
    end
  end
end
