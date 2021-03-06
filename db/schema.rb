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

ActiveRecord::Schema.define(version: 2019_08_20_181859) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.bigint "vet_id"
    t.bigint "pet_id"
    t.date "date"
    t.time "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pet_id"], name: "index_appointments_on_pet_id"
    t.index ["vet_id"], name: "index_appointments_on_vet_id"
  end

  create_table "charts", force: :cascade do |t|
    t.bigint "vet_id"
    t.bigint "pet_id"
    t.boolean "vaccination", default: false
    t.boolean "medication", default: false
    t.boolean "diagnosis", default: false
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pet_id"], name: "index_charts_on_pet_id"
    t.index ["vet_id"], name: "index_charts_on_vet_id"
  end

  create_table "clinics", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "owners", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "uid"
    t.string "provider"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.string "breed"
    t.date "dob"
    t.integer "gender"
    t.bigint "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "species"
    t.index ["owner_id"], name: "index_pets_on_owner_id"
  end

  create_table "vets", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.bigint "clinic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clinic_id"], name: "index_vets_on_clinic_id"
  end

  add_foreign_key "appointments", "pets"
  add_foreign_key "appointments", "vets"
  add_foreign_key "charts", "pets"
  add_foreign_key "charts", "vets"
  add_foreign_key "pets", "owners"
  add_foreign_key "vets", "clinics"
end
