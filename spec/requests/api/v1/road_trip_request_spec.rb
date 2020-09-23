require 'rails_helper'

describe 'Road Trip Planner' do
  it 'should create a road trip given two locations' do
    user = User.new({email: 'email', password: 'password' })
    user.save
    post '/api/v1/road_trip', params:
    {
      origin: 'Denver,CO',
      destination: 'Pueblo,CO',
      api_key: user.api_key
    }
    json = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(200)
    expect(json[:data][:attributes].keys).to include(:origin)
    expect(json[:data][:attributes].keys).to include(:destination)
    expect(json[:data][:attributes].keys).to include(:time)
    expect(json[:data][:attributes].keys).to include(:temperature)
    expect(json[:data][:attributes].keys).to include(:description)
    expect(json[:data][:attributes][:origin]).to eq("Denver, CO")
    expect(json[:data][:attributes][:destination]).to eq("Pueblo, CO")
  end
end
