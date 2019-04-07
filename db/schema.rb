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

ActiveRecord::Schema.define(version: 2019_04_07_162528) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "access_points", force: :cascade do |t|
    t.string "ssid"
    t.string "ip_address"
    t.string "mac_address"
    t.bigint "zone_id"
    t.string "user"
    t.string "password"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["zone_id"], name: "index_access_points_on_zone_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "title", limit: 50, default: ""
    t.text "comment"
    t.string "commentable_type"
    t.bigint "commentable_id"
    t.bigint "user_id"
    t.string "role", default: "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_id"], name: "index_comments_on_commentable_id"
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
    t.index ["commentable_type"], name: "index_comments_on_commentable_type"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "coordinates", force: :cascade do |t|
    t.float "latitude"
    t.float "longitude"
    t.string "locatable_type"
    t.bigint "locatable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["locatable_type", "locatable_id"], name: "index_coordinates_on_locatable_type_and_locatable_id"
  end

  create_table "data", force: :cascade do |t|
    t.bigint "mobile_id"
    t.bigint "access_point_id"
    t.string "type"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["access_point_id"], name: "index_data_on_access_point_id"
    t.index ["mobile_id"], name: "index_data_on_mobile_id"
  end

  create_table "issues", force: :cascade do |t|
    t.datetime "since"
    t.integer "status"
    t.string "description"
    t.bigint "user_id"
    t.bigint "access_point_id"
    t.datetime "solved_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["access_point_id"], name: "index_issues_on_access_point_id"
    t.index ["user_id"], name: "index_issues_on_user_id"
  end

  create_table "issues_reports", force: :cascade do |t|
    t.bigint "issue_id"
    t.bigint "data_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["data_id"], name: "index_issues_reports_on_data_id"
    t.index ["issue_id"], name: "index_issues_reports_on_issue_id"
  end

  create_table "location_devices", force: :cascade do |t|
    t.bigint "access_point_id"
    t.bigint "coordinate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["access_point_id"], name: "index_location_devices_on_access_point_id"
    t.index ["coordinate_id"], name: "index_location_devices_on_coordinate_id"
  end

  create_table "mobiles", force: :cascade do |t|
    t.string "mac_address"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_mobiles_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "notificable_type"
    t.bigint "notificable_id"
    t.string "text"
    t.bigint "user_id"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["notificable_type", "notificable_id"], name: "index_notifications_on_notificable_type_and_notificable_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "permission_roles", force: :cascade do |t|
    t.bigint "permission_id"
    t.bigint "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["permission_id"], name: "index_permission_roles_on_permission_id"
    t.index ["role_id"], name: "index_permission_roles_on_role_id"
  end

  create_table "permissions", force: :cascade do |t|
    t.string "name"
    t.string "subject_class"
    t.string "action"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "settings", force: :cascade do |t|
    t.string "var", null: false
    t.text "value"
    t.integer "thing_id"
    t.string "thing_type", limit: 30
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["thing_type", "thing_id", "var"], name: "index_settings_on_thing_type_and_thing_id_and_var", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.string "id_number"
    t.bigint "role_id"
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
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  create_table "zone__devices", force: :cascade do |t|
    t.bigint "access_point_id"
    t.bigint "zone_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["access_point_id"], name: "index_zone__devices_on_access_point_id"
    t.index ["zone_id"], name: "index_zone__devices_on_zone_id"
  end

  create_table "zones", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "data", "access_points"
  add_foreign_key "data", "mobiles"
  add_foreign_key "issues", "access_points"
  add_foreign_key "issues", "users"
  add_foreign_key "issues_reports", "data", column: "data_id"
  add_foreign_key "issues_reports", "issues"
  add_foreign_key "location_devices", "access_points"
  add_foreign_key "location_devices", "coordinates"
  add_foreign_key "notifications", "users"
  add_foreign_key "permission_roles", "permissions"
  add_foreign_key "permission_roles", "roles"
  add_foreign_key "zone__devices", "access_points"
  add_foreign_key "zone__devices", "zones"
end
