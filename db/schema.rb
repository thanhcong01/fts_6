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

ActiveRecord::Schema.define(version: 20140723044341) do

  create_table "answers", force: true do |t|
    t.text     "answer"
    t.boolean  "isCorrect"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["question_id", "created_at"], name: "index_answers_on_question_id_and_created_at", using: :btree

  create_table "question_answers", force: true do |t|
    t.text     "contextQuestion"
    t.text     "contentAnswer"
    t.boolean  "IsCorrect"
    t.integer  "register_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "question_answers", ["register_id", "created_at"], name: "index_question_answers_on_register_id_and_created_at", using: :btree

  create_table "questions", force: true do |t|
    t.text     "contextQuestion"
    t.integer  "subject_id"
    t.boolean  "isControllText"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["subject_id", "created_at"], name: "index_questions_on_subject_id_and_created_at", using: :btree

  create_table "registers", force: true do |t|
    t.datetime "dateTest"
    t.integer  "CountAnswerCorrect"
    t.float    "mark",               limit: 24
    t.boolean  "finish",                        default: false
    t.integer  "user_id"
    t.integer  "subject_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "registers", ["subject_id", "created_at"], name: "index_registers_on_subject_id_and_created_at", using: :btree
  add_index "registers", ["user_id", "created_at"], name: "index_registers_on_user_id_and_created_at", using: :btree

  create_table "subjects", force: true do |t|
    t.text     "contextDisplay"
    t.integer  "totalTime"
    t.integer  "countQuestion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "passwork"
    t.boolean  "admin",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
