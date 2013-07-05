class AddDistanceToPres < ActiveRecord::Migration
  def change
    add_column :pres, :distance, :string
  end
end
