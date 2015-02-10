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

ActiveRecord::Schema.define(version: 20150210133544) do

  create_table "broadcasts", force: :cascade do |t|
    t.text     "name",           limit: 65535
    t.text     "url",            limit: 65535
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.datetime "broadcast_date"
    t.text     "session_name",   limit: 65535
    t.text     "real_audio",     limit: 65535
    t.text     "part1title",     limit: 65535
    t.text     "part2title",     limit: 65535
    t.text     "part3title",     limit: 65535
    t.text     "part4title",     limit: 65535
    t.text     "ra1",            limit: 65535
    t.text     "ra2",            limit: 65535
    t.text     "ra3",            limit: 65535
  end

  create_table "tracks", force: :cascade do |t|
    t.integer "broadcast_id", limit: 4
    t.integer "part",         limit: 4
    t.text    "artist",       limit: 65535
    t.text    "title",        limit: 65535
    t.text    "composed",     limit: 65535
    t.text    "published",    limit: 65535
    t.text    "record_label", limit: 65535
    t.text    "catalogue_no", limit: 65535
    t.text    "duration",     limit: 65535
    t.text    "notes",        limit: 65535
  end

end
