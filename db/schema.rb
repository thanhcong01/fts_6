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

ActiveRecord::Schema.define(version: 20140811035622) do

  create_table "answer_sheets", force: true do |t|
    t.boolean  "correct"
    t.boolean  "finish"
    t.integer  "register_id"
    t.integer  "question_id"
    t.integer  "answer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answer_sheets", ["answer_id", "created_at"], name: "index_answer_sheets_on_answer_id_and_created_at", using: :btree
  add_index "answer_sheets", ["question_id", "created_at"], name: "index_answer_sheets_on_question_id_and_created_at", using: :btree
  add_index "answer_sheets", ["register_id", "created_at"], name: "index_answer_sheets_on_register_id_and_created_at", using: :btree

  create_table "answers", force: true do |t|
    t.text     "answer"
    t.boolean  "correct"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["question_id", "created_at"], name: "index_answers_on_question_id_and_created_at", using: :btree

  create_table "categories", force: true do |t|
    t.string   "name_category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.text     "context_question"
    t.integer  "subject_id"
    t.boolean  "is_controll_text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["subject_id", "created_at"], name: "index_questions_on_subject_id_and_created_at", using: :btree

  create_table "registers", force: true do |t|
    t.datetime "date_test"
    t.integer  "count_correct"
    t.float    "mark",          limit: 24
    t.boolean  "finish",                   default: false
    t.boolean  "start",                    default: false
    t.integer  "user_id"
    t.integer  "subject_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "registers", ["category_id", "created_at"], name: "index_registers_on_category_id_and_created_at", using: :btree
  add_index "registers", ["slug"], name: "index_registers_on_slug", using: :btree
  add_index "registers", ["subject_id", "created_at"], name: "index_registers_on_subject_id_and_created_at", using: :btree
  add_index "registers", ["user_id", "created_at"], name: "index_registers_on_user_id_and_created_at", using: :btree

  create_table "subjects", force: true do |t|
    t.string   "context_display"
    t.integer  "total_time"
    t.integer  "count_question"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.string   "password_digest"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
