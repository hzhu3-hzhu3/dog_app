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

ActiveRecord::Schema[8.0].define(version: 2025_03_19_024744) do
  create_table "breed_diseases", force: :cascade do |t|
    t.integer "breed_id", null: false
    t.integer "dog_disease_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["breed_id"], name: "index_breed_diseases_on_breed_id"
    t.index ["dog_disease_id"], name: "index_breed_diseases_on_dog_disease_id"
  end

  create_table "breed_facts", force: :cascade do |t|
    t.integer "fact_id", null: false
    t.integer "breed_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["breed_id"], name: "index_breed_facts_on_breed_id"
    t.index ["fact_id"], name: "index_breed_facts_on_fact_id"
  end

  create_table "breeds", force: :cascade do |t|
    t.string "name"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dog_diseases", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dog_images", force: :cascade do |t|
    t.string "url"
    t.integer "breed_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["breed_id"], name: "index_dog_images_on_breed_id"
  end

  create_table "facts", force: :cascade do |t|
    t.text "fact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "breed_diseases", "breeds"
  add_foreign_key "breed_diseases", "dog_diseases"
  add_foreign_key "breed_facts", "breeds"
  add_foreign_key "breed_facts", "facts"
  add_foreign_key "dog_images", "breeds"
end
