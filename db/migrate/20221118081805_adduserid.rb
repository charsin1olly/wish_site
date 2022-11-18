class Adduserid < ActiveRecord::Migration[6.1]
  def change
    # add_column :wish_lists, :user_id ,:integer
    # add_index :wish ,:user

    add_belongs_to :wish_lists ,:user
  end
end
