class Friendship < ActiveRecord::Base
  attr_accessible :first_user_id, :last_invite_date, :last_pre_date, :relationship, :second_user_id, :second_relationship
  belongs_to :user
end
