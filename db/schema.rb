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

ActiveRecord::Schema.define(:version => 20140822055355) do

  create_table "goals", :force => true do |t|
    t.integer  "user_id"
    t.string   "description", :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "goals", ["user_id"], :name => "goals_user_id_fk"

  create_table "pings", :force => true do |t|
    t.integer  "wait_id"
    t.string   "description", :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "pings", ["wait_id"], :name => "pings_wait_id_fk"

  create_table "updates", :force => true do |t|
    t.integer  "user_id"
    t.string   "description", :null => false
    t.datetime "start_time",  :null => false
    t.datetime "stop_time"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "updates", ["user_id"], :name => "updates_user_id_fk"

  create_table "users", :force => true do |t|
    t.string   "first_name", :null => false
    t.string   "last_name",  :null => false
    t.string   "email",      :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "users", ["email"], :name => "idx_unique_emails", :unique => true

  create_table "waits", :force => true do |t|
    t.integer  "user_id"
    t.string   "description", :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "waits", ["user_id"], :name => "waits_user_id_fk"

  add_foreign_key "goals", "users", name: "goals_user_id_fk", dependent: :delete

  add_foreign_key "pings", "waits", name: "pings_wait_id_fk", dependent: :delete

  add_foreign_key "updates", "users", name: "updates_user_id_fk", dependent: :delete

  add_foreign_key "waits", "users", name: "waits_user_id_fk", dependent: :delete

end
