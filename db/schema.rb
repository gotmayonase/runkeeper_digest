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

ActiveRecord::Schema.define(:version => 20120123020141) do

  create_table "activities", :force => true do |t|
    t.string   "activity_type"
    t.datetime "start_time"
    t.integer  "total_distance"
    t.decimal  "duration"
    t.decimal  "total_calories"
    t.integer  "user_id"
    t.string   "uri"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "activities", ["activity_type"], :name => "index_activities_on_activity_type"
  add_index "activities", ["start_time"], :name => "index_activities_on_start_time"
  add_index "activities", ["uri"], :name => "index_activities_on_uri"

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "nickname"
    t.string   "token"
    t.string   "athlete_type"
    t.date     "birthday"
    t.string   "gender"
    t.string   "goal"
    t.string   "location"
    t.integer  "runkeeper_id"
    t.string   "name"
    t.string   "medium_picture"
    t.string   "normal_picture"
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
    t.datetime "last_import_attempt"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
