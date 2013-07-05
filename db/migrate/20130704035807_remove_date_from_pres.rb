class RemoveDateFromPres < ActiveRecord::Migration
  def up
    remove_column :pres, :date
  end

  def down
    add_column :pres, :date, :string
  end
end
