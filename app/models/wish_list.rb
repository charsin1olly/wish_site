class WishList < ApplicationRecord
  validates :title , presence: true
  validates :description , presence: true

  #scope
  # scopes :not_deleted , ->{where(deleted_at: nil)}
  # default_scopes {where(delete_time: nil)}

  #relationship
  belongs_to :user
  has_many :comments

  has_many :like_wish_lists
  has_many :liked_users ,through: :like_wish_lists ,source: :user


  acts_as_paranoid
  # def destroy
  #   update(delete_time: Time.current)
  # end

  def liked_by?(user)
    liked_users.include?(user)
  end
end
 