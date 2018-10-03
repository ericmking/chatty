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

ActiveRecord::Schema.define(version: 2018_10_02_185446) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "band_members", force: :cascade do |t|
    t.bigint "band_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["band_id"], name: "index_band_members_on_band_id"
    t.index ["user_id"], name: "index_band_members_on_user_id"
  end

  create_table "bands", force: :cascade do |t|
    t.string "name"
    t.bigint "created_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_id"], name: "index_bands_on_created_by_id"
  end

  create_table "chat_rooms", force: :cascade do |t|
    t.string "name"
    t.bigint "band_id"
    t.bigint "created_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["band_id"], name: "index_chat_rooms_on_band_id"
    t.index ["created_by_id"], name: "index_chat_rooms_on_created_by_id"
  end

  create_table "folders", force: :cascade do |t|
    t.string "name"
    t.bigint "band_id"
    t.bigint "folder_id"
    t.bigint "created_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["band_id"], name: "index_folders_on_band_id"
    t.index ["created_by_id"], name: "index_folders_on_created_by_id"
    t.index ["folder_id"], name: "index_folders_on_folder_id"
  end

  create_table "gigs", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "band_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "location_venue"
    t.string "location_address_1"
    t.string "location_address_2"
    t.string "location_city"
    t.string "location_state"
    t.string "location_postal_code"
    t.string "location_country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["band_id"], name: "index_gigs_on_band_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.bigint "user_id"
    t.bigint "chat_room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_room_id"], name: "index_messages_on_chat_room_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "band_id"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "due_date"
    t.datetime "completed_date"
    t.bigint "created_by_id"
    t.bigint "responsible_user_id"
    t.index ["band_id"], name: "index_tasks_on_band_id"
    t.index ["created_by_id"], name: "index_tasks_on_created_by_id"
    t.index ["responsible_user_id"], name: "index_tasks_on_responsible_user_id"
  end

  create_table "uploads", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "folder_id"
    t.bigint "created_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_id"], name: "index_uploads_on_created_by_id"
    t.index ["folder_id"], name: "index_uploads_on_folder_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_users_on_invitations_count"
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "band_members", "bands"
  add_foreign_key "band_members", "users"
  add_foreign_key "bands", "users", column: "created_by_id"
  add_foreign_key "chat_rooms", "bands"
  add_foreign_key "chat_rooms", "users", column: "created_by_id"
  add_foreign_key "folders", "bands"
  add_foreign_key "folders", "users", column: "created_by_id"
  add_foreign_key "gigs", "bands"
  add_foreign_key "messages", "chat_rooms"
  add_foreign_key "messages", "users"
  add_foreign_key "tasks", "bands"
  add_foreign_key "tasks", "users", column: "created_by_id"
  add_foreign_key "tasks", "users", column: "responsible_user_id"
  add_foreign_key "uploads", "folders"
  add_foreign_key "uploads", "users", column: "created_by_id"
end
