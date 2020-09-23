require 'rails_helper'

describe LocationFacade do
  describe "class methods" do
    it "can return a coordinate OpenStruct given a location" do
      location = 'denver,co'
      result = LocationFacade.find_coordinates(location)
      expect(result.lat.round(2)).to eq(39.74)
      expect(result.long.round(2)).to eq(-104.98)
    end
  end
end
