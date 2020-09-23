require 'rails_helper'

describe ImageFacade do
  describe 'class methods' do
    it 'find image' do
      location = 'denver,co'
      facade = ImageFacade
      result = ImageFacade.find_image(location)
      expect(result).to be_an Image
    end
    it "can create an image poro" do
      data = {
        results: [
          urls: {regular: "image_link"},
          user: {name: 'name', portfolio_url: 'portfolio link'}
        ]
      }
      location = 'denver,co'
      facade = ImageFacade
      result = ImageFacade.create_image_poro(data,location)
      expect(result).to be_an Image
      expect(result.location).to eq(location)
      expect(result.url).to eq(data[:results][0][:urls][:regular])
      expect(result.credits[:artist_name]).to eq(data[:results][0][:user][:name])
      expect(result.credits[:artist_portfolio]).to eq(data[:results][0][:user][:portfolio_url])
    end
  end
end
