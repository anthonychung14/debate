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

ActiveRecord::Schema.define(version: 2020_03_15_021547) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string "full_name"
    t.string "education"
    t.text "description"
    t.string "occupation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "authors_source_content_works", force: :cascade do |t|
    t.bigint "authors_id"
    t.bigint "source_contents_id"
    t.index ["authors_id"], name: "index_authors_source_content_works_on_authors_id"
    t.index ["source_contents_id"], name: "index_authors_source_content_works_on_source_contents_id"
  end

  create_table "card_creators", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.string "string"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "creators", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.string "string"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "excerpts", force: :cascade do |t|
    t.integer "start_position"
    t.integer "end_position"
    t.integer "source_content_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "source_cards", force: :cascade do |t|
    t.string "header"
    t.string "warrant"
    t.string "subheader"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "source_content_works", force: :cascade do |t|
    t.string "authors"
    t.string "source_contents"
  end

  create_table "source_contents", force: :cascade do |t|
    t.string "link"
    t.string "title"
    t.string "subtitle"
    t.string "publisher"
    t.bigint "publish_date"
    t.string "medium"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "authors_source_content_works", "authors", column: "authors_id"
  add_foreign_key "authors_source_content_works", "source_contents", column: "source_contents_id"
end
