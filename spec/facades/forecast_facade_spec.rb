require 'rails_helper'

describe ForecastFacade do
  it "can find a forecast given a city/state and return an object" do
    location = "Denver,CO"
    result = ForecastFacade.find_forecast(location)
    expect(result).to be_a OpenStruct
  end
end
