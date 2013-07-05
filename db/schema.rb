# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130705031457) do

  create_table "affiliations", :force => true do |t|
    t.string   "first_pre_id"
    t.string   "second_pre_id"
    t.string   "relationship"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "distance"
  end

  create_table "friendships", :force => true do |t|
    t.string   "first_user_id"
    t.string   "second_user_id"
    t.string   "relationship"
    t.string   "last_pre_date"
    t.string   "last_invite_date"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "second_relationship"
    t.string   "second_last_pre_date"
    t.string   "second_last_invite_date"
  end

  create_table "invites", :force => true do |t|
    t.string   "pre_id"
    t.string   "user_id"
    t.string   "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pres", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "facebook_event_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "owner"
    t.string   "user_status"
    t.string   "distance"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "latitude"
    t.integer  "longitude"
    t.string   "gender"
    t.string   "email"
    t.string   "facebook_id"
    t.string   "pre_id"
    t.string   "pre_status"
    t.integer  "num_invites"
    t.string   "picture_url"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
