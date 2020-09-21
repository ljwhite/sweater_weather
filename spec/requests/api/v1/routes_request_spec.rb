require 'rails_helper'

describe 'Routes Controller' do
  it "can send all information regarding routes" do

    get '/api/v1/climbing_routes?location=erwin,tn'
    expect(response).to be_successful
    binding.pry 
  end
end
