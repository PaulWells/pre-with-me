class AddUserStatusToPres < ActiveRecord::Migration
  def change
    add_column :pres, :user_status, :string
  end
end
