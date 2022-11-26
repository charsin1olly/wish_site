class Comment < ApplicationRecord
  acts_as_paranoid
  #validates
  validates :content ,presence: true

  # relationship
  belongs_to :user
  belongs_to :wish_list
  
end
