require 'rails_helper'

describe ForecastSummary do
  it 'can initialize an object given attributes' do
    attributes = {
      current_forecast: {
        current_description: "rainy",
        current_temp: 57
      }
    }
    summary = ForecastSummary.new(attributes)
    expect(summary).to be_a ForecastSummary
    expect(summary.summary).to eq(attributes[:current_forecast][:current_description])
    expect(summary.temperature).to eq(attributes[:current_forecast][:current_temp])
  end
end
