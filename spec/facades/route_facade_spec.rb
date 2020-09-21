require 'rails_helper'

describe RouteFacade do
  describe 'class methods' do
    it "can find routes given a location" do
      location = "erwin,tn"
      result = RouteFacade.find_routes(location)
      expect(result).to be_an OpenStruct
      binding.pry
    end
  end
end
