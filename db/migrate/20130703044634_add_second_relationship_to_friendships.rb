class AddSecondRelationshipToFriendships < ActiveRecord::Migration
  def change
    add_column :friendships, :second_relationship, :string
  end
end
