require 'rails_helper'

describe 'User Login API' do
  it 'should allow a user to login' do
    user = User.new({email: 'email', password: 'password' })
    user.save
    post '/api/v1/sessions', params: {email: 'email', password: 'password' }
    json = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(201)
    expect(json[:data][:attributes].keys).to include(:api_key)
    expect(json[:data][:attributes][:api_key]).to be_a String
    expect(json[:data][:attributes][:api_key]).to eq(user.api_key)
    expect(json[:data][:attributes][:email]).to eq(user.email)
    expect(json[:data][:id]).to eq(user.id.to_s)
  end

  it 'if the password is not correct, it will return a 400-level status' do
    user = User.new({email: 'email', password: 'password' })
    user.save
    post '/api/v1/sessions', params: {email: 'email', password: 'wrong_password' }
    json = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(400)
    expect(json[:error]).to eq('Incorrect Password')
  end
  it "if the user does not exist in the database, the login will fail " do
    post '/api/v1/sessions', params: {email: 'wrong_email', password: 'password' }
    json = JSON.parse(response.body, symbolize_names: true)
    expect(json[:error]).to eq('User not found')
  end
end
