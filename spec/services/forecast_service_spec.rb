require 'rails_helper'

describe ForecastService do
  describe 'class methods' do
    it "returns weather data" do
      service = ForecastService
      lat = 39.738453
      long = -104.984853
      location = OpenStruct.new(
        lat: lat,
        long: long
      )
      search = service.find_forecast(location)
      expect(search).to be_a Hash
      expect(search[:lat]).to eq(lat.round(2))
      expect(search[:lon]).to eq(long.round(2))
    end

    it "should perform a successful search" do
      expected_attributes = [
        :lat,
        :lon,
        :current,
        :hourly,
        :daily
      ]
      service = ForecastService
      lat = 39.738453
      long = -104.984853
      location = OpenStruct.new(
        lat: lat,
        long: long
      )
      search = service.find_forecast(location)
      expected_attributes.each do |attribute|
        expect(search).to have_key(attribute)
      end
    end
  end
end
