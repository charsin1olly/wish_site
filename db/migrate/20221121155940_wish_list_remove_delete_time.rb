class WishListRemoveDeleteTime < ActiveRecord::Migration[6.1]
  def change
    remove_column :wish_lists, :delete_time
  end
end
