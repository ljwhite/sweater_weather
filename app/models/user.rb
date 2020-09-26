class User < ApplicationRecord

  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, require: true
  before_create :generate_api_key #after_save
  #validates uniqueness of api_key 
  has_secure_password

  def generate_api_key
    self.api_key = SecureRandom.uuid #can add
  end
end
