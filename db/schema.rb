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

ActiveRecord::Schema.define(version: 20150724130148) do

  create_table "comments", force: :cascade do |t|
    t.integer  "swit_id",    limit: 4
    t.integer  "user_id",    limit: 4
    t.string   "content",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "comments", ["swit_id"], name: "index_comments_on_swit_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "ratings", force: :cascade do |t|
    t.integer  "swit_id",    limit: 4
    t.integer  "user_id",    limit: 4
    t.boolean  "rate",       limit: 1
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "ratings", ["swit_id"], name: "index_ratings_on_swit_id", using: :btree
  add_index "ratings", ["user_id"], name: "index_ratings_on_user_id", using: :btree

  create_table "swits", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "content",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "swits", ["user_id"], name: "index_swits_on_user_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.integer  "swit_id",    limit: 4
    t.string   "content",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "tags", ["swit_id"], name: "index_tags_on_swit_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",        limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "password_digest", limit: 255
  end

  add_foreign_key "comments", "swits"
  add_foreign_key "comments", "users"
  add_foreign_key "ratings", "swits"
  add_foreign_key "ratings", "users"
  add_foreign_key "swits", "users"
  add_foreign_key "tags", "swits"
end
