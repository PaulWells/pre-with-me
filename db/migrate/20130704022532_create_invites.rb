class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.string :pre_id
      t.string :user_id
      t.string :status

      t.timestamps
    end
  end
end
