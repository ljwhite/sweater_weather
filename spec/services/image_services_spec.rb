require 'rails_helper'

describe ImageService do
  describe 'class methods' do
    it 'returns an image given a location' do
      service = ImageService
      location = 'denver,co'
      search = service.find_location_image(location)
      expect(search).to be_a Hash
      expect(search[:results].count).to eq(1)
      expect(search[:results][0]).to have_key :urls
      expect(search[:results][0][:urls]).to have_key :regular
      expect(search[:results][0]).to have_key :user
      expect(search[:results][0][:user]).to have_key :name
      expect(search[:results][0][:user]).to have_key :portfolio_url
    end
  end
end
