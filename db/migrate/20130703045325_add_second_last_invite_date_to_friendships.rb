class AddSecondLastInviteDateToFriendships < ActiveRecord::Migration
  def change
    add_column :friendships, :second_last_invite_date, :string
  end
end
