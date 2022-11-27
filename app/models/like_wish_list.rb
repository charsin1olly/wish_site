class LikeWishList < ApplicationRecord
  belongs_to :wish_list
  belongs_to :user

end
