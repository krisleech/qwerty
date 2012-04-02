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

ActiveRecord::Schema.define(:version => 20110922185424) do

  create_table "documents", :force => true do |t|
    t.string   "permalink"
    t.string   "title"
    t.text     "body"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth",            :default => 0
    t.integer  "position",         :default => 1
    t.integer  "node_id"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.text     "summary"
    t.boolean  "published",        :default => false
    t.string   "url"
    t.string   "image_uid"
    t.string   "image_name"
    t.date     "published_at"
    t.string   "meta_title"
    t.string   "meta_description"
    t.string   "meta_keywords"
    t.string   "image_alt"
    t.string   "template"
  end

  create_table "node_settings", :force => true do |t|
    t.string   "key"
    t.string   "value"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth",       :default => 0
    t.integer  "node_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.string   "value_klass"
  end

  create_table "nodes", :force => true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "position",   :default => 0
    t.integer  "depth",      :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "ancestry"
  end

end
