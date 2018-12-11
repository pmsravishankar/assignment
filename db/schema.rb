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

ActiveRecord::Schema.define(version: 2018_12_11_064143) do

  create_table "assets", id: :string, limit: 5, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "eff_dt", null: false
    t.text "html_string"
    t.integer "ver_nbr", null: false
    t.string "title", limit: 128
    t.string "description", limit: 512
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "aud_logs", primary_key: ["rec_id", "sent_dttm"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "rec_id", default: 0, null: false
    t.datetime "sent_dttm", null: false
    t.string "asset_id"
    t.bigint "cust_id"
    t.string "loan_nbr", limit: 16
    t.string "chnl", limit: 16
    t.string "view_sts", limit: 1, default: "0"
    t.string "sent_to", limit: 128
    t.string "del_flg", limit: 1, default: "0"
    t.integer "ver_nbr"
    t.datetime "asset_eff_dt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asset_id"], name: "index_aud_logs_on_asset_id"
  end

  create_table "configs", primary_key: ["cust_id", "ntftn_id"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "cust_id", default: 0, null: false
    t.bigint "ntftn_id", default: 0, null: false
    t.string "loan_nbr", limit: 16
    t.string "asset_id"
    t.string "actv_sts", limit: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asset_id"], name: "index_configs_on_asset_id"
  end

  add_foreign_key "aud_logs", "assets"
  add_foreign_key "configs", "assets"
end
