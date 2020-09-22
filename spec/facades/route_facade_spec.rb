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
  end
end
