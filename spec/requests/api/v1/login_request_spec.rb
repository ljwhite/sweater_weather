require 'rails_helper'

describe 'User Login API' do
  it 'should allow a user to login' do
    user = User.new({email: 'email', password: 'password' })
    user.save
    post '/api/v1/sessions', params: {email: 'email', password: 'password' }
    json = JSON.parse(response.body)
    expect(response.status).to eq(201)
  end
  it 'if the password is not correct, it will return a 400-level status' do
    user = User.new({email: 'email', password: 'password' })
    user.save
    post '/api/v1/sessions', params: {email: 'email', password: 'wrong_password' }
    json = JSON.parse(response.body)
    expect(response.status).to eq(400)
    expect(json['error']).to eq('Incorrect Password')
  end
  it "if the user does not exist in the database, the login will fail " do
    post '/api/v1/sessions', params: {email: 'wrong_email', password: 'password' }
    json = JSON.parse(response.body)
  end
end
