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

ActiveRecord::Schema[7.0].define(version: 2022_11_20_221126) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clinics", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.text "address"
    t.string "phone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_clinics_on_user_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_countries_on_code"
  end

  create_table "doctors", force: :cascade do |t|
    t.bigint "specialist_id"
    t.bigint "workspace_id"
    t.float "chat_price"
    t.float "phone_price"
    t.float "video_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["specialist_id"], name: "index_doctors_on_specialist_id"
    t.index ["workspace_id"], name: "index_doctors_on_workspace_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "weight"
    t.string "height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "specialists", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_specialists_on_code"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.text "address"
    t.bigint "country_id"
    t.integer "gender"
    t.string "secure_pin"
    t.string "secure_pin_checkout"
    t.string "avatar"
    t.string "user_type"
    t.string "user_status"
    t.string "login_status"
    t.string "user_identity_card"
    t.string "fcm_token"
    t.string "personable_type"
    t.bigint "personable_id"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_users_on_country_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["personable_type", "personable_id"], name: "index_users_on_personable"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "workspaces", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "address"
    t.bigint "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_workspaces_on_country_id"
  end

end
