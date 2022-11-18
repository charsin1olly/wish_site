class WishList < ApplicationRecord
  validates :title , presence: true
  validates :description , presence: true

  #relationship
  belongs_to :users
end
 