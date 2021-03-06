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

ActiveRecord::Schema.define(version: 20170326140450) do

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "guts_categories", force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.text "metafields"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "site_id"
    t.index ["site_id"], name: "index_guts_categories_on_site_id"
    t.index ["slug"], name: "index_guts_categories_on_slug"
  end

  create_table "guts_categorizations", force: :cascade do |t|
    t.integer "category_id"
    t.integer "content_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "guts_contents", force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.text "tags"
    t.text "content"
    t.integer "visible", limit: 1, default: 1
    t.integer "type_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "site_id"
    t.index ["site_id"], name: "index_guts_contents_on_site_id"
    t.index ["slug"], name: "index_guts_contents_on_slug"
  end

  create_table "guts_groups", force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_guts_groups_on_slug", unique: true
  end

  create_table "guts_media", force: :cascade do |t|
    t.string "title"
    t.text "tags"
    t.integer "position", default: 0
    t.string "filable_type"
    t.integer "filable_id"
    t.string "caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "file_file_name"
    t.string "file_content_type"
    t.integer "file_file_size"
    t.datetime "file_updated_at"
    t.integer "site_id"
    t.index ["filable_type", "filable_id"], name: "index_guts_media_on_filable_type_and_filable_id"
    t.index ["site_id"], name: "index_guts_media_on_site_id"
  end

  create_table "guts_metafields", force: :cascade do |t|
    t.string "key"
    t.text "value"
    t.string "fieldable_type"
    t.integer "fieldable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "site_id"
    t.index ["fieldable_type", "fieldable_id"], name: "index_guts_metafields_on_fieldable_type_and_fieldable_id"
    t.index ["site_id"], name: "index_guts_metafields_on_site_id"
  end

  create_table "guts_navigation_items", force: :cascade do |t|
    t.string "title"
    t.string "custom"
    t.integer "position", default: 0
    t.string "navigatable_type"
    t.integer "navigatable_id"
    t.integer "navigation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "site_id"
    t.index ["navigatable_type", "navigatable_id"], name: "index_nav_items_on_nav_with_type_and_id"
    t.index ["site_id"], name: "index_guts_navigation_items_on_site_id"
  end

  create_table "guts_navigations", force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "site_id"
    t.index ["site_id"], name: "index_guts_navigations_on_site_id"
    t.index ["slug"], name: "index_guts_navigations_on_slug"
  end

  create_table "guts_options", force: :cascade do |t|
    t.string "key"
    t.text "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "site_id"
    t.index ["site_id"], name: "index_guts_options_on_site_id"
  end

  create_table "guts_permissions", force: :cascade do |t|
    t.string "resource"
    t.string "grant"
    t.string "permissionable_type"
    t.integer "permissionable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["permissionable_type", "permissionable_id"], name: "index_permissions_on_permissionable_type_and_permissionable"
  end

  create_table "guts_sites", force: :cascade do |t|
    t.string "name"
    t.string "domain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "default", default: false
  end

  create_table "guts_types", force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "site_id"
    t.index ["site_id"], name: "index_guts_types_on_site_id"
    t.index ["slug"], name: "index_guts_types_on_slug"
  end

  create_table "guts_user_groups", force: :cascade do |t|
    t.integer "user_id"
    t.integer "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "guts_users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "password_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
