class User < ApplicationRecord
  #validates
  validates :email, presence: true
  validates :password,
             confirmation: true,
             length: { minimum: 6 }

  before_create :encrypt_password

  #relationship
  has_many :wish_lists


  # callbacks
  before_create :encrypt_password

  # class methods
  def self.login(email, password)
    hashed_password = Digest::SHA1.hexdigest("keke#{password.reverse}haha")
    find_by(email: email , password: hashed_password)
  end



  private 
  def encrypt_password
  self.password = Digest::SHA1.hexdigest("keke#{self.password.reverse}haha")
  end
end
