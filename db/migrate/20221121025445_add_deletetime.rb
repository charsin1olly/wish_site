class AddDeletetime < ActiveRecord::Migration[6.1]
  def change
    add_column :wish_lists, :delete_time , :datetime
    add_index :wish_lists ,:delete_time
  end
end
