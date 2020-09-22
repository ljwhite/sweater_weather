require 'rails_helper'

describe RouteDisplay do
  describe 'instance methods' do
    it 'can instantiate an object given attributes' do
      attributes = {
        location: "Denver",
        forecast_summary: "All clear",
        routes: "So many to climb!",
        route_distance: 5
      }
      route_display = RouteDisplay.new(attributes)
      expect(route_display).to be_a RouteDisplay
      expect(route_display.location).to eq(attributes[:location])
      expect(route_display.forecast_summary).to eq(attributes[:forecast_summary])
      expect(route_display.routes).to eq(attributes[:routes])
      expect(route_display.route_distance).to eq(attributes[:route_distance])
    end
    it "can fetch values of a route distance given a route name" do
      route = OpenStruct.new(name: 'Crescent')
      attributes = {route_distance: {"Crescent" => 5, "Jagged Peak" => 10}}
      route_display = RouteDisplay.new(attributes)
      distance = route_display.find_distance_to_route(route)
      expect(distance).to eq(5)
    end
  end
end
