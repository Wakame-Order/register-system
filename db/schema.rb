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

ActiveRecord::Schema.define(version: 20160329065543) do

  create_table "friends", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "klasses", force: true do |t|
    t.string   "klass_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", force: true do |t|
    t.integer  "user_id"
    t.string   "gender"
    t.string   "status_flag"
    t.string   "enter_year"
    t.string   "major"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "grade"
  end

  create_table "time_tables", force: true do |t|
    t.integer  "user_id"
    t.integer  "klass_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "account"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
