class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :latitude
      t.integer :longitude
      t.string :gender
      t.string :email
      t.string :facebook_id
      t.string :pre_id
      t.string :pre_status
      t.integer :num_invites
      t.string :picture_url

      t.timestamps
    end
  end
end
