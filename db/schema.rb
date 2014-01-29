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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140129022936) do

  create_table "answers", :force => true do |t|
    t.string   "text"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "question_id"
    t.integer  "sequence"
  end

  create_table "notes", :force => true do |t|
    t.string   "title"
    t.string   "department"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "survey_id"
  end

  create_table "patients", :force => true do |t|
    t.string   "gender"
    t.date     "dob"
    t.string   "doctor"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_name"
  end

  create_table "questions", :force => true do |t|
    t.string   "text"
    t.string   "kind"
    t.boolean  "required"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "survey_id"
    t.integer  "sequence"
  end

  create_table "responses", :force => true do |t|
    t.text     "value"
    t.integer  "survey_id"
    t.integer  "patient_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "segments", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.integer  "sequence"
    t.integer  "note_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "surveys", :force => true do |t|
    t.string   "title"
    t.string   "type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username",         :null => false
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

end
