require 'rails_helper'

describe RouteService do
  describe 'class methods' do
    it 'returns a list of routes' do
      service = RouteService
      lat = 40.03
      long = -105.25
      location = OpenStruct.new(
        lat: lat,
        long: long
      )
      search = service.find_routes(location)
      expect(search).to be_an Hash
      expect(search[:routes].count).to eq(5)
      expect(search[:routes][0].keys).to include(:id)
      expect(search[:routes][0].keys).to include(:name)
      expect(search[:routes][0].keys).to include(:type)
      expect(search[:routes][0].keys).to include(:rating)
      expect(search[:routes][0].keys).to include(:location)
    end
  end
end
