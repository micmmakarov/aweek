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

ActiveRecord::Schema.define(:version => 20120422165805) do

  create_table "attachments", :force => true do |t|
    t.integer  "post_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pic_file_name"
    t.string   "pic_content_type"
    t.integer  "pic_file_size"
    t.datetime "pic_updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "date"
    t.integer  "user_id"
    t.integer  "organisation_id"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "city"
    t.integer  "category_id"
  end

  create_table "organisations", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "address"
    t.text     "contacts"
    t.text     "description"
    t.string   "city"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.string   "pic_file_name"
    t.string   "pic_content_type"
    t.integer  "pic_file_size"
    t.datetime "pic_updated_at"
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.integer  "organisation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.boolean  "published"
    t.boolean  "featured"
  end

  create_table "relationships", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.integer  "organisation_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["category_id"], :name => "index_relationships_on_category_id"
  add_index "relationships", ["followed_id"], :name => "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "category_id"], :name => "index_relationships_on_follower_id_and_category_id", :unique => true
  add_index "relationships", ["follower_id", "followed_id"], :name => "index_relationships_on_follower_id_and_followed_id", :unique => true
  add_index "relationships", ["follower_id", "organisation_id"], :name => "index_relationships_on_follower_id_and_organisation_id", :unique => true
  add_index "relationships", ["follower_id"], :name => "index_relationships_on_follower_id"
  add_index "relationships", ["organisation_id"], :name => "index_relationships_on_organisation_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.integer  "role"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
