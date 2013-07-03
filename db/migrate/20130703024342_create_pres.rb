class CreatePres < ActiveRecord::Migration
  def change
    create_table :pres do |t|
      t.string :name
      t.string :description
      t.string :date
      t.integer :latitude
      t.integer :longitude
      t.string :facebook_event_id

      t.timestamps
    end
  end
end
