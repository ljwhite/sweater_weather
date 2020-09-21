require 'rails_helper'

describe 'Forecast API' do
  it 'send a forecast' do

    get '/api/v1/forecast?location=denver,co'
    expect(response).to be_successful
    forecast = response.parsed_body#JSON.parse(response.body)
    expect(forecast['data']['attributes']['data'].keys).to include('current_forecast')
    expect(forecast['data']['attributes']['data'].keys).to include('hourly_forecast')
    expect(forecast['data']['attributes']['data'].keys).to include('daily_forecast')
  end
end
