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

ActiveRecord::Schema.define(version: 20140502215234) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "title"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id"
  end

  create_table "categories_places", id: false, force: true do |t|
    t.integer "place_id",    null: false
    t.integer "category_id", null: false
  end

  create_table "cities", force: true do |t|
    t.string   "name"
    t.integer  "state_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "neighborhoods", force: true do |t|
    t.string   "name"
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "places", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.float    "lat"
    t.float    "lon"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address"
    t.string   "number"
    t.integer  "category"
    t.integer  "neighborhood_id"
    t.integer  "city_id"
    t.string   "state"
    t.string   "cep"
    t.string   "phone"
  end

  create_table "ratings", force: true do |t|
    t.integer  "place_id"
    t.float    "score",      default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ratings", ["place_id"], name: "index_ratings_on_place_id", using: :btree

  create_table "searchjoy_searches", force: true do |t|
    t.string   "search_type"
    t.string   "query"
    t.string   "normalized_query"
    t.integer  "results_count"
    t.datetime "created_at"
    t.integer  "convertable_id"
    t.string   "convertable_type"
    t.datetime "converted_at"
  end

  add_index "searchjoy_searches", ["convertable_id", "convertable_type"], name: "index_searchjoy_searches_on_convertable_id_and_convertable_type", using: :btree
  add_index "searchjoy_searches", ["created_at"], name: "index_searchjoy_searches_on_created_at", using: :btree
  add_index "searchjoy_searches", ["search_type", "created_at"], name: "index_searchjoy_searches_on_search_type_and_created_at", using: :btree
  add_index "searchjoy_searches", ["search_type", "normalized_query", "created_at"], name: "index_searchjoy_searches_on_search_type_and_normalized_query_an", using: :btree

end
