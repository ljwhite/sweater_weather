require 'rails_helper'

describe 'Road Trip Planner' do
  it 'should create a road trip given two locations' do
    user = User.new({email: 'email_1', password: 'password' })
    user.save
    post '/api/v1/road_trip', params:
    {
      origin: 'Denver,CO',
      destination: 'Pueblo,CO',
      api_key: user.api_key
    }
    json = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(200)
    expect(response.content_type).to eq('application/json')
    expect(json[:data][:attributes].keys).to include(:origin)
    expect(json[:data][:attributes].keys).to include(:destination)
    expect(json[:data][:attributes].keys).to include(:time)
    expect(json[:data][:attributes].keys).to include(:temperature)
    expect(json[:data][:attributes].keys).to include(:description)
    expect(json[:data][:attributes][:origin]).to eq("Denver, CO")
    expect(json[:data][:attributes][:destination]).to eq("Pueblo, CO")
  end

  it "if the api key cannot be found, a 401-level status will result" do
    api_key = "123abc"
    post '/api/v1/road_trip', params:
    {
      origin: 'Denver,CO',
      destination: 'Pueblo,CO',
      api_key: api_key
    }
    expect(response.status).to eq(401)
    json = JSON.parse(response.body, symbolize_names: true)
    expect(json[:error]).to eq("User cannot be verified")
  end

  it "if the api key is not provided, a 401-level status will result" do

    post '/api/v1/road_trip', params:
    {
      origin: 'Denver,CO',
      destination: 'Pueblo,CO',
    }
    expect(response.status).to eq(401)
    json = JSON.parse(response.body, symbolize_names: true)
    expect(json[:error]).to eq("User cannot be verified")
  end
end
