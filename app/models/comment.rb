class Comment < ApplicationRecord
  
  #validates
  validates :content ,presence: true

  # relationship
  belongs_to :user
  
end
