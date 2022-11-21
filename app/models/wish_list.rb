class WishList < ApplicationRecord
  validates :title , presence: true
  validates :description , presence: true

  #scope
  # scopes :not_deleted , ->{where(deleted_at: nil)}
  # default_scopes {where(delete_time: nil)}

  #relationship
  belongs_to :user
  has_many :comments

  acts_as_paranoid
  # def destroy
  #   update(delete_time: Time.current)
  # end

end
 