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

ActiveRecord::Schema.define(version: 20160605195516) do

  create_table "active_widgets", force: :cascade do |t|
    t.integer  "dashboard_user_setting_id", limit: 4, null: false
    t.integer  "widget_id",                 limit: 4, null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "active_widgets", ["dashboard_user_setting_id"], name: "index_active_widgets_on_dashboard_user_setting_id", using: :btree
  add_index "active_widgets", ["widget_id"], name: "index_active_widgets_on_widget_id", using: :btree

  create_table "avatars", force: :cascade do |t|
    t.string   "url",        limit: 255, default: "default_avatar.png", null: false
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
  end

  create_table "buildings", force: :cascade do |t|
    t.string   "shortname",       limit: 255, null: false
    t.string   "name",            limit: 255, null: false
    t.string   "city",            limit: 255
    t.string   "street",          limit: 255
    t.integer  "user_id",         limit: 4,   null: false
    t.integer  "dashboard_id",    limit: 4,   null: false
    t.integer  "company_type_id", limit: 4,   null: false
    t.integer  "country_id",      limit: 4,   null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "buildings", ["company_type_id"], name: "index_buildings_on_company_type_id", using: :btree
  add_index "buildings", ["country_id"], name: "index_buildings_on_country_id", using: :btree
  add_index "buildings", ["dashboard_id"], name: "index_buildings_on_dashboard_id", using: :btree
  add_index "buildings", ["user_id"], name: "index_buildings_on_user_id", using: :btree

  create_table "company_types", force: :cascade do |t|
    t.string "name", limit: 255, null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.string   "code",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "dashboard_assignments", force: :cascade do |t|
    t.integer  "dashboard_id",              limit: 4, null: false
    t.integer  "user_id",                   limit: 4, null: false
    t.integer  "dashboard_user_setting_id", limit: 4, null: false
    t.integer  "dashboard_role_id",         limit: 4, null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "dashboard_assignments", ["dashboard_id"], name: "index_dashboard_assignments_on_dashboard_id", using: :btree
  add_index "dashboard_assignments", ["dashboard_role_id"], name: "index_dashboard_assignments_on_dashboard_role_id", using: :btree
  add_index "dashboard_assignments", ["dashboard_user_setting_id"], name: "index_dashboard_assignments_on_dashboard_user_setting_id", using: :btree
  add_index "dashboard_assignments", ["user_id"], name: "index_dashboard_assignments_on_user_id", using: :btree

  create_table "dashboard_group_assignments", force: :cascade do |t|
    t.integer  "group_id",          limit: 4, null: false
    t.integer  "dashboard_role_id", limit: 4, null: false
    t.integer  "dashboard_id",      limit: 4, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "dashboard_group_assignments", ["dashboard_id"], name: "index_dashboard_group_assignments_on_dashboard_id", using: :btree
  add_index "dashboard_group_assignments", ["dashboard_role_id"], name: "index_dashboard_group_assignments_on_dashboard_role_id", using: :btree
  add_index "dashboard_group_assignments", ["group_id"], name: "index_dashboard_group_assignments_on_group_id", using: :btree

  create_table "dashboard_roles", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.integer  "rank",       limit: 4,   null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "dashboard_user_settings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dashboards", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "lab_roles", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.integer  "rank",       limit: 4,   null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "laboratories", force: :cascade do |t|
    t.string   "name",        limit: 255, null: false
    t.integer  "building_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "laboratories", ["building_id"], name: "index_laboratories_on_building_id", using: :btree

  create_table "laboratories_assignments", force: :cascade do |t|
    t.integer  "user_id",       limit: 4, null: false
    t.integer  "laboratory_id", limit: 4, null: false
    t.integer  "lab_role_id",   limit: 4, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "laboratories_assignments", ["lab_role_id"], name: "index_laboratories_assignments_on_lab_role_id", using: :btree
  add_index "laboratories_assignments", ["laboratory_id"], name: "index_laboratories_assignments_on_laboratory_id", using: :btree
  add_index "laboratories_assignments", ["user_id"], name: "index_laboratories_assignments_on_user_id", using: :btree

  create_table "log_types", force: :cascade do |t|
    t.string  "name", limit: 255, null: false
    t.integer "rank", limit: 4,   null: false
  end

  create_table "logs", force: :cascade do |t|
    t.text     "log",         limit: 65535,                     null: false
    t.string   "category",    limit: 255,   default: "unknown", null: false
    t.integer  "user_id",     limit: 4
    t.integer  "log_type_id", limit: 4,                         null: false
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  add_index "logs", ["log_type_id"], name: "index_logs_on_log_type_id", using: :btree
  add_index "logs", ["user_id"], name: "index_logs_on_user_id", using: :btree

  create_table "site_roles", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.integer  "rank",       limit: 4,   null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "visible_name",    limit: 255,                                 null: false
    t.string   "email",           limit: 255,                                 null: false
    t.string   "first_name",      limit: 255
    t.string   "last_name",       limit: 255
    t.datetime "age"
    t.string   "password_digest", limit: 255,                                 null: false
    t.datetime "last_login",                  default: '2016-06-21 19:49:28', null: false
    t.string   "last_ip",         limit: 255, default: "0.0.0.0",             null: false
    t.boolean  "was_activated",               default: false,                 null: false
    t.boolean  "active",                      default: true,                  null: false
    t.datetime "last_seen",                   default: '2016-06-21 19:49:28', null: false
    t.integer  "site_role_id",    limit: 4,                                   null: false
    t.datetime "created_at",                                                  null: false
    t.datetime "updated_at",                                                  null: false
  end

  add_index "users", ["site_role_id"], name: "index_users_on_site_role_id", using: :btree

  create_table "users_avatars", force: :cascade do |t|
    t.boolean  "active",               default: false, null: false
    t.integer  "user_id",    limit: 4,                 null: false
    t.integer  "avatar_id",  limit: 4,                 null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "users_avatars", ["avatar_id"], name: "index_users_avatars_on_avatar_id", using: :btree
  add_index "users_avatars", ["user_id"], name: "index_users_avatars_on_user_id", using: :btree

  create_table "users_groups", force: :cascade do |t|
    t.integer  "user_id",    limit: 4, null: false
    t.integer  "group_id",   limit: 4, null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "users_groups", ["group_id"], name: "index_users_groups_on_group_id", using: :btree
  add_index "users_groups", ["user_id"], name: "index_users_groups_on_user_id", using: :btree

  create_table "widgets", force: :cascade do |t|
    t.string   "name",       limit: 255,             null: false
    t.integer  "widgetscol", limit: 4,   default: 0, null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "workstations", force: :cascade do |t|
    t.string   "name",          limit: 255,             null: false
    t.integer  "number",        limit: 4,   default: 0, null: false
    t.integer  "laboratory_id", limit: 4
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "workstations", ["laboratory_id"], name: "index_workstations_on_laboratory_id", using: :btree

  add_foreign_key "active_widgets", "dashboard_user_settings"
  add_foreign_key "active_widgets", "widgets"
  add_foreign_key "buildings", "company_types"
  add_foreign_key "buildings", "countries"
  add_foreign_key "buildings", "dashboards"
  add_foreign_key "buildings", "users"
  add_foreign_key "dashboard_assignments", "dashboard_roles"
  add_foreign_key "dashboard_assignments", "dashboard_user_settings"
  add_foreign_key "dashboard_assignments", "dashboards"
  add_foreign_key "dashboard_assignments", "users"
  add_foreign_key "dashboard_group_assignments", "dashboard_roles"
  add_foreign_key "dashboard_group_assignments", "dashboards"
  add_foreign_key "dashboard_group_assignments", "groups"
  add_foreign_key "laboratories", "buildings"
  add_foreign_key "laboratories_assignments", "lab_roles"
  add_foreign_key "laboratories_assignments", "laboratories"
  add_foreign_key "laboratories_assignments", "users"
  add_foreign_key "logs", "log_types"
  add_foreign_key "logs", "users"
  add_foreign_key "users", "site_roles"
  add_foreign_key "users_avatars", "avatars"
  add_foreign_key "users_avatars", "users"
  add_foreign_key "users_groups", "groups"
  add_foreign_key "users_groups", "users"
  add_foreign_key "workstations", "laboratories"
end
