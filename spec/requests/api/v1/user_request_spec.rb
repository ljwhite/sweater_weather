require 'rails_helper'

describe 'User API' do
  it 'should create a new user' do
    expect {
      post '/api/v1/users', params: {email: 'email_1', password: 'abc', password_confirmation: 'abc'}
    }.to change{User.count}.by(1)
    json = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(response.status).to eq(201)
    expect(response.content_type).to eq('application/json')
    expect(response.body).not_to include('abc')
  end
  it "will return a 400-level status if passwords don't match " do
    expect {
      post '/api/v1/users', params: {email: 'email', password: 'abc', password_confirmation: 'abcd'}
    }.to change{User.count}.by(0)
    json = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(422)
    expect(json[:password_confirmation][0]).to eq("doesn't match Password")
  end
  it "will return a 400-level status if email already exists" do
    user1 = User.new({email: 'email', password: 'password' })
    user1.save
    expect {
      post '/api/v1/users', params: {email: 'email', password: 'abc', password_confirmation: 'abc'}
    }.to change{User.count}.by(0)
    json = JSON.parse(response.body, symbolize_names: true)
    expect(response.status).to eq(422)
    expect(json[:email][0]).to eq("has already been taken")
  end
end
