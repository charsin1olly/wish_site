class WishList < ApplicationRecord
  validates :title , presence: true
  validates :description , presence: true

  #scope
  # scopes :not_deleted , ->{where(delete_time: nil)}
  # default_scopes {where(delete_time: nil)}

  #relationship
  belongs_to :user

  acts_as_paranoid
  # def destroy
  #   update(delete_time: Time.current)
  # end

end
 