require 'rails_helper'

describe ForecastFacade do
  it 'can return coordinates when given a location' do
    lat = 39.738453
    long = -104.984853
    location = 'Denver,CO'
    result = ForecastFacade.find_coordinates(location)
    expect(result).to be_an OpenStruct
    expect(result.lat).to be_a Float
    expect(result.long).to be_a Float
    expect(result.lat).to eq(lat)
    expect(result.long).to eq(long)
  end
end
