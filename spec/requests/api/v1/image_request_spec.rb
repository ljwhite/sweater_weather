require 'rails_helper'

describe 'Image API' do
  it "returns an image json" do
    get '/api/v1/backgrounds?location=denver,co'
    expect(response).to be_successful
    expect(response.content_type).to eq('application/json')
    data = JSON.parse(response.body, symbolize_names: true)
    expect(data[:data].keys).to include(:attributes)
    expect(data[:data][:attributes].keys).to include(:location)
    expect(data[:data][:attributes].keys).to include(:url)
    expect(data[:data][:attributes].keys).to include(:credits)
  end
end
