require 'rails_helper'

describe User, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
  end
  describe 'password encryption' do
    it "will store an encrypted password" do
      user = User.new({email: 'email', password: 'password' })
      expect(user.password_digest).not_to eq('password')
    end
  end
  describe 'generate api_key' do
    it "will generate an api key when the user is saved" do
      user = User.new({email: 'email_1', password: 'password' })
      expect(user.api_key).to be_nil
      user.save
      expect(user.api_key).to be_truthy #more robust test (test for uuid)
    end
  end
  describe 'class methods' do
    it "generate_api_key" do
      user = User.new({email: 'email', password: 'password' })
      expect(user.api_key).to be_nil
      user.generate_api_key
      expect(user.api_key).to be_truthy
    end
  end
end
