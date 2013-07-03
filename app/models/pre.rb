class Pre < ActiveRecord::Base
  attr_accessible :date, :description, :facebook_event_id, :latitude, :longitude, :name, :owner
  has_many :users
end
