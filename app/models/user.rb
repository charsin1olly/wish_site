class User < ApplicationRecord
  validates :email, presence: true
  validates :password,
             confirmation: true,
             length: { minimum: 6 }

  before_save :encrypt_password

  private 
  def :encrypt_password
  self.password = 
  end
end
