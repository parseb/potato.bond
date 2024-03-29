# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_07_19_131806) do
  create_table "areas", force: :cascade do |t|
    t.string "governor"
    t.string "nrc"
    t.string "nrf"
    t.string "area_name"
    t.string "rule_contract"
    t.string "data_url"
    t.string "area_id"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "baskets", force: :cascade do |t|
    t.string "data_url"
    t.string "farmer_address"
    t.string "consumer_address"
    t.string "state"
    t.string "nft_id"
    t.string "area_id"
    t.string "price"
    t.string "erc_address"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "consumers", force: :cascade do |t|
    t.string "address"
    t.string "name"
    t.string "email"
    t.string "pending"
    t.string "claimed"
    t.string "data_url"
    t.string "area_address"
    t.string "nft_id"
    t.string "area_id"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "farmers", force: :cascade do |t|
    t.string "address"
    t.string "gps"
    t.string "name"
    t.string "amount_issued"
    t.string "amount_fulfilled"
    t.string "referred_by"
    t.string "farmsize"
    t.string "data_url"
    t.string "area_address"
    t.string "nft_id"
    t.string "area_id"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "global_states", force: :cascade do |t|
    t.string "gid"
    t.string "fetchables"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", primary_key: "address", id: :string, force: :cascade do |t|
    t.datetime "last_seen", precision: nil
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address"], name: "index_users_on_address", unique: true
  end

end
