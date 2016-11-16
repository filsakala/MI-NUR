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

ActiveRecord::Schema.define(version: 20161116154118) do

  create_table "homepages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kolos", force: :cascade do |t|
    t.integer  "cislo",      limit: 4
    t.integer  "rocnik",     limit: 4
    t.string   "seria",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "komentars", force: :cascade do |t|
    t.string   "autor",      limit: 255
    t.string   "text",       limit: 255
    t.integer  "priklad_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "komentars", ["priklad_id"], name: "index_komentars_on_priklad_id", using: :btree

  create_table "priklads", force: :cascade do |t|
    t.string   "nazov",        limit: 255
    t.string   "text",         limit: 255
    t.string   "pred_t",       limit: 255
    t.string   "po_t",         limit: 255
    t.string   "vzorak",       limit: 255
    t.string   "autor",        limit: 255
    t.string   "kategoria",    limit: 255
    t.string   "stav",         limit: 255
    t.integer  "kolo_id",      limit: 4
    t.integer  "cislo_v_kole", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "priklads", ["kolo_id"], name: "index_priklads_on_kolo_id", using: :btree

  create_table "rocniks", force: :cascade do |t|
    t.integer  "cislo",      limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "seria", force: :cascade do |t|
    t.string   "nazov",      limit: 255
    t.integer  "rocnik",     limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
