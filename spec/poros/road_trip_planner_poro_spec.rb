require 'rails_helper'

describe RoadTripPlanner do
  it "can instantiate an object" do
    attributes =
    {
      trip_time: 'time',
      temperature: 'temp',
      description: 'describe',
      origin: 'origination',
      destination: 'destination'
    }
    result = RoadTripPlanner.new(attributes)
    expect(result.time).to eq(attributes[:trip_time])
    expect(result.temperature).to eq(attributes[:temperature])
    expect(result.description).to eq(attributes[:description])
    expect(result.origin).to eq(attributes[:origin])
    expect(result.destination).to eq(attributes[:destination])
  end
end
