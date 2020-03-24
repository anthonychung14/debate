# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_23_191401) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "content_makers", force: :cascade do |t|
    t.string "full_name"
    t.string "instagramHandle"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "airtable_key"
    t.string "notes"
    t.string "address"
    t.string "city"
    t.integer "zipcode"
    t.uuid "uuid", default: -> { "uuid_generate_v4()" }, null: false
  end

  create_table "content_makers_source_contents", force: :cascade do |t|
    t.bigint "content_maker_id", null: false
    t.bigint "source_content_id", null: false
    t.index ["content_maker_id"], name: "index_content_makers_source_contents_on_content_maker_id"
    t.index ["source_content_id"], name: "index_content_makers_source_contents_on_source_content_id"
  end

  create_table "creators", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.string "string"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.uuid "uuid", default: -> { "uuid_generate_v4()" }, null: false
  end

  create_table "excerpts", force: :cascade do |t|
    t.integer "start_position"
    t.integer "end_position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "source_content_id", null: false
    t.string "link"
    t.string "image_link"
    t.uuid "uuid", default: -> { "uuid_generate_v4()" }, null: false
    t.string "text_content"
    t.string "content_medium"
    t.string "gif_url"
    t.string "giphy_id"
    t.string "airtable_key"
    t.string "title"
    t.index ["source_content_id"], name: "index_excerpts_on_source_content_id"
  end

  create_table "source_cards", force: :cascade do |t|
    t.string "header"
    t.string "warrant"
    t.string "subheader"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "creator_id", null: false
    t.uuid "uuid", default: -> { "uuid_generate_v4()" }, null: false
    t.index ["creator_id"], name: "index_source_cards_on_creator_id"
  end

  create_table "source_contents", force: :cascade do |t|
    t.string "link"
    t.string "title"
    t.string "subtitle"
    t.string "publisher"
    t.bigint "publish_date"
    t.string "content_category", default: "OTHER"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "content_medium"
    t.string "gif_url"
    t.string "giphy_id"
    t.string "synopsis"
    t.string "series_name"
    t.string "md5hash"
    t.string "image_link"
    t.uuid "uuid", default: -> { "uuid_generate_v4()" }, null: false
    t.string "airtable_key"
  end

  add_foreign_key "content_makers_source_contents", "content_makers"
  add_foreign_key "content_makers_source_contents", "source_contents"
  add_foreign_key "excerpts", "source_contents"
  add_foreign_key "source_cards", "creators"
end
