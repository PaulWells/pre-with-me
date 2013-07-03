class AddOwnerIdToPres < ActiveRecord::Migration
  def change
    add_column :pres, :owner, :string
  end
end
