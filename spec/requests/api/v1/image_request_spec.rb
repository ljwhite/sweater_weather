require 'rails_helper'

describe 'Image API' do
  it "returns an image json" do
    get '/api/v1/backgrounds?location=denver,co'
    expect(response).to be_successful
  end
end
