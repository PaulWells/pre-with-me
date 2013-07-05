class ChangeLatitudeToFloat < ActiveRecord::Migration
  def self.up
    change_table :pres do |t|
      t.change :latitude, :float
    end
  end
  def self.down
    change_table :pres do |t|
      t.change :latitude, :integer
    end
  end
end
