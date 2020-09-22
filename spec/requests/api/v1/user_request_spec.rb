require 'rails_helper'

describe 'User API' do
  it 'should create a new user' do
    # params_data = :params => {email: 'email', password: 'abc', password_confirmation: 'abc'}

    post '/api/v1/users', params: {email: 'email', password: 'abc', password_confirmation: 'abc'}
    json = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    user = User.last

  end
end
