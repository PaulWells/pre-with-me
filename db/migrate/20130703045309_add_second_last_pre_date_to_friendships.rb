class AddSecondLastPreDateToFriendships < ActiveRecord::Migration
  def change
    add_column :friendships, :second_last_pre_date, :string
  end
end
