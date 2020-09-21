require 'rails_helper'

describe ImageService do
  describe 'Class methods' do
    it 'returns an image' do
      service = ImageService
      query = 'denver,co'
      search = service.find_image(query)
      expect(search.present?).to be_truthy
    end
  end
end
