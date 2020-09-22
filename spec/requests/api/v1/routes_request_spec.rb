require 'rails_helper'

describe 'Routes Controller' do
  it "can send all information regarding routes" do

    get '/api/v1/climbing_routes?location=erwin,tn'
    expect(response).to be_successful
    expect(response.content_type).to include('application/json')
    json = JSON.parse(response.body, symbolize_names: true)
    expect(json[:data][:type]).to eq('climbing route')
    expect(json[:data][:attributes].keys).to include(:location)
    expect(json[:data][:attributes][:location]).to eq('erwin,tn')
    expect(json[:data][:attributes].keys).to include(:forecast)
    expect(json[:data][:attributes][:forecast].keys).to include(:summary)
    expect(json[:data][:attributes][:forecast].keys).to include(:temperature)
    expect(json[:data][:attributes].keys).to include(:routes)
    expect(json[:data][:attributes][:routes]).to be_an Array
    expect(json[:data][:attributes][:routes][0].keys).to include(:name)
    expect(json[:data][:attributes][:routes][0].keys).to include(:type)
    expect(json[:data][:attributes][:routes][0].keys).to include(:location)
    expect(json[:data][:attributes][:routes][0].keys).to include(:rating)
    expect(json[:data][:attributes][:routes][0].keys).to include(:distance_to_route)
    expect(json[:data][:attributes][:routes][0][:location]).to be_an Array
    expect(json[:data][:attributes][:routes][0][:distance_to_route]).to be_a Float

  end
end
