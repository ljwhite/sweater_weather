require 'rails_helper'

describe 'Forecast API' do
  it 'send a forecast' do
    get '/api/v1/forecast?location=denver,co'
    expect(response).to be_successful
    expect(response.content_type).to eq('application/json')
    forecast = JSON.parse(response.body, symbolize_names: true)
    expect(forecast[:data][0][:attributes][:data].keys).to include(:current_forecast)
    expect(forecast[:data][0][:attributes][:data].keys).to include(:hourly_forecast)
    expect(forecast[:data][0][:attributes][:data].keys).to include(:daily_forecast)
    forecast[:data][0][:attributes][:data][:daily_forecast].each do |day|
      expect(day[1].keys).to include(:day)
      expect(day[1].keys).to include(:high)
      expect(day[1][:high]).to be_an Integer
      expect(day[1][:low]).to be_an Integer
      expect(day[1][:description]).to be_an String
      expect(day[1].keys).to include(:low)
      expect(day[1].keys).to include(:rainfall)
      expect(day[1].keys).to include(:snowfall)
    end
    forecast[:data][0][:attributes][:data][:hourly_forecast].each do |hour|
      expect(hour[1].keys).to include(:temp)
      expect(hour[1].keys).to include(:description)
      expect(hour[1].keys).to include(:time)
      expect(hour[1][:temp]).to be_an Integer
      expect(hour[1][:time]).to be_a String
      expect(hour[1][:description]).to be_a String
    end
    expect(forecast[:data][0][:attributes][:data][:current_forecast].keys).to include(:current_temp)
    expect(forecast[:data][0][:attributes][:data][:current_forecast].keys).to include(:feels_like)
    expect(forecast[:data][0][:attributes][:data][:current_forecast].keys).to include(:humidity)
    expect(forecast[:data][0][:attributes][:data][:current_forecast].keys).to include(:uv_index)
  end
end
