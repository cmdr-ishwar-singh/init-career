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

ActiveRecord::Schema.define(version: 2019_04_27_111129) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "init_career_career_submissions", force: :cascade do |t|
    t.bigint "career_id"
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "current_company"
    t.string "linkedin_url"
    t.string "twitter_url"
    t.string "github_url"
    t.string "other_url"
    t.string "gender"
    t.string "veteran_status"
    t.string "disability_status"
    t.text "question_answers"
    t.text "note"
    t.text "status", default: "0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "init_career_careers", force: :cascade do |t|
    t.string "title"
    t.string "position"
    t.string "location"
    t.text "description"
    t.text "questions"
    t.boolean "status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
