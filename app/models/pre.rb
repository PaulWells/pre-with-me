class Pre < ActiveRecord::Base
  attr_accessible :description, :facebook_event_id, :latitude, :longitude, :name, :owner, :user_status, :distance
  has_many :users
end
