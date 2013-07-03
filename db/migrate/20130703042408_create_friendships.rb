class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.string :first_user_id
      t.string :second_user_id
      t.string :relationship
      t.string :last_pre_date
      t.string :last_invite_date

      t.timestamps
    end
  end
end
