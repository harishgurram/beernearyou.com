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

ActiveRecord::Schema.define(version: 20141214125505) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "stations", force: true do |t|
    t.string   "name"
    t.decimal  "lat",        precision: 10, scale: 6
    t.decimal  "lng",        precision: 10, scale: 6
    t.integer  "zone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stations", ["lat", "lng"], name: "index_stations_on_lat_and_lng", using: :btree

  create_table "suggestions", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "venues", force: true do |t|
    t.string   "name"
    t.string   "foursquare_id"
    t.integer  "untappd_id"
    t.decimal  "lat",            precision: 10, scale: 6
    t.decimal  "lng",            precision: 10, scale: 6
    t.string   "street_address"
    t.string   "city"
    t.string   "postal_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "venues", ["foursquare_id"], name: "index_venues_on_foursquare_id", using: :btree
  add_index "venues", ["lat", "lng"], name: "index_venues_on_lat_and_lng", using: :btree
  add_index "venues", ["untappd_id"], name: "index_venues_on_untappd_id", using: :btree

end
