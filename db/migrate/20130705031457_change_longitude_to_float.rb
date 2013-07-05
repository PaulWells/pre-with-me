class ChangeLongitudeToFloat < ActiveRecord::Migration
  def self.up
    change_table :pres do |t|
      t.change :longitude, :float
    end
  end
  def self.down
    change_table :pres do |t|
      t.change :longitude, :integer
    end
  end
end
