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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20131123002152) do

  create_table "advertisements", force: true do |t|
    t.string   "title"
    t.integer  "position"
    t.boolean  "active"
    t.string   "caption"
    t.boolean  "display_caption"
    t.string   "image_file"
    t.string   "link_to"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "advertisements", ["active"], name: "index_advertisements_on_active"

  create_table "ciders", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image_file"
    t.string   "season"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", force: true do |t|
    t.string   "name"
    t.string   "position"
    t.text     "biography"
    t.string   "image_file"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "updates", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image_file",    default: "updates/default.png"
    t.datetime "post_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "link_to"
    t.integer  "advertisement"
  end

  add_index "updates", ["advertisement"], name: "index_updates_on_advertisement", unique: true
  add_index "updates", ["post_at"], name: "index_updates_on_post_at"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", unique: true

end
