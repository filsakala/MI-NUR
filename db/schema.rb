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

ActiveRecord::Schema.define(version: 20161123085115) do

  create_table "homepages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "knizka_obsahs", force: :cascade do |t|
    t.string   "nazov",      limit: 255
    t.string   "text",       limit: 255
    t.integer  "cislo",      limit: 4
    t.integer  "knizka_id",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "knizka_obsahs", ["knizka_id"], name: "index_knizka_obsahs_on_knizka_id", using: :btree

  create_table "knizkas", force: :cascade do |t|
    t.integer  "rocnik",     limit: 4
    t.string   "seria",      limit: 255
    t.integer  "cislo",      limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
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

  create_table "organizators", force: :cascade do |t|
    t.string   "meno",       limit: 255
    t.string   "priezvisko", limit: 255
    t.string   "nick",       limit: 255
    t.string   "status",     limit: 255
    t.string   "email",      limit: 255
    t.string   "telefon",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "pdfs", force: :cascade do |t|
    t.integer  "knizka_id",  limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "priklads", force: :cascade do |t|
    t.string   "nazov",        limit: 255
    t.string   "text",         limit: 2048
    t.string   "pred_t",       limit: 2048
    t.string   "po_t",         limit: 2048
    t.string   "vzorak",       limit: 2048
    t.string   "autor",        limit: 255
    t.string   "kategoria",    limit: 255
    t.string   "stav",         limit: 255
    t.integer  "kolo_id",      limit: 4
    t.integer  "cislo_v_kole", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "priklads", ["kolo_id"], name: "index_priklads_on_kolo_id", using: :btree

  create_table "riesitel_seria", force: :cascade do |t|
    t.string   "skola",       limit: 255
    t.string   "trieda",      limit: 255
    t.integer  "kategoria",   limit: 4
    t.boolean  "eriesitel",   limit: 1
    t.integer  "rocnik",      limit: 4
    t.string   "seria",       limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "riesitel_id", limit: 4
    t.integer  "seria_id",    limit: 4
  end

  add_index "riesitel_seria", ["riesitel_id"], name: "index_riesitel_seria_on_riesitel_id", using: :btree
  add_index "riesitel_seria", ["seria_id"], name: "index_riesitel_seria_on_seria_id", using: :btree

  create_table "riesitels", force: :cascade do |t|
    t.string   "meno",            limit: 255
    t.string   "priezvisko",      limit: 255
    t.string   "adresa",          limit: 255
    t.string   "datum_narodenia", limit: 255
    t.string   "telefon",         limit: 255
    t.string   "telefon_rodic",   limit: 255
    t.string   "email",           limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

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
