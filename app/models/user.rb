class User < ActiveRecord::Base
  attr_accessible :email, :facebook_id, :first_name, :gender, :last_name, :latitude, :longitude, :num_invites, :picture_url, :pre_id, :pre_status
  belongs_to :pre
  has_many :friendships
end
