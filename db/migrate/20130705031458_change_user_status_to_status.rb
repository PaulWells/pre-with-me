class ChangeUserStatusToStatus < ActiveRecord::Migration
  def self.up

    rename_column :pres, :user_status, :status

  end
  def self.down

    rename_column :pres, :status, :user_status

  end
end
