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

ActiveRecord::Schema.define(version: 20150926064447) do

  create_table "items", force: :cascade do |t|
    t.string   "title"
    t.string   "url"
    t.datetime "published_at"
    t.string   "media_type"
    t.text     "blurb"
    t.datetime "sent_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "items_lists", id: false, force: :cascade do |t|
    t.integer "list_id", null: false
    t.integer "item_id", null: false
  end

  add_index "items_lists", ["item_id", "list_id"], name: "index_items_lists_on_item_id_and_list_id"
  add_index "items_lists", ["list_id", "item_id"], name: "index_items_lists_on_list_id_and_item_id"

  create_table "lists", force: :cascade do |t|
    t.string   "subject"
    t.text     "body"
    t.integer  "state"
    t.datetime "sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
