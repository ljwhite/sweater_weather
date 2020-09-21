require 'rails_helper'

describe RouteFacade do
  describe 'class methods' do
    it "can find routes given a location" do
      location = "erwin,tn"
      result = RouteFacade.find_routes(location)
      expect(result).to be_a Hash
    end
  end
end