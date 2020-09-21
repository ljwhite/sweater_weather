require 'rails_helper'

describe 'Unsplash API' do
  it 'sends an image' do
    get '/api/v1/backgrounds?location=denver,co'
    
  end
end
