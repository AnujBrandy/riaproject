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

ActiveRecord::Schema.define(version: 20151110001832) do

  create_table "artists", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "gravatar_url"
    t.text     "description"
    t.string   "skill"
    t.integer  "experience"
    t.string   "facebook_url"
    t.string   "twitter_url"
    t.string   "contact_no"
    t.text     "address"
    t.string   "country"
    t.string   "state"
    t.string   "city"
    t.string   "availability"
    t.string   "youtube_url"
    t.string   "behance_url"
    t.string   "facebook_page"
    t.string   "blog_url"
    t.string   "website_url"
    t.string   "other_url"
    t.text     "motto_line"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.boolean  "admin",           default: false
  end

  add_index "artists", ["email"], name: "index_artists_on_email", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
