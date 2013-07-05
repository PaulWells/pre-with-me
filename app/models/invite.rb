class Invite < ActiveRecord::Base
  attr_accessible :pre_id, :status, :user_id
  belongs_to :pre
  belongs_to :user
end
