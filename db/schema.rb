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

ActiveRecord::Schema.define(:version => 20130112192239) do

  create_table "definitions", :force => true do |t|
    t.text     "text"
    t.integer  "user_id"
    t.integer  "word_id"
    t.integer  "language_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "glosses", :force => true do |t|
    t.text     "text"
    t.integer  "glossable_id"
    t.string   "glossable_type", :default => "word"
    t.integer  "language_id"
    t.integer  "tag_id"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  create_table "languages", :force => true do |t|
    t.text     "code"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "places", :force => true do |t|
    t.integer  "word_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "rafsi", :force => true do |t|
    t.text     "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "word_id"
  end

  create_table "source_words_used_by_words", :id => false, :force => true do |t|
    t.integer "source_word_id",  :null => false
    t.integer "used_by_word_id", :null => false
  end

  add_index "source_words_used_by_words", ["source_word_id", "used_by_word_id"], :name => "word_ids"

  create_table "tags", :force => true do |t|
    t.text     "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.text     "name"
    t.text     "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "votes", :force => true do |t|
    t.integer  "vote"
    t.integer  "user_id"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.integer  "voteable_id"
    t.string   "voteable_type", :default => "definition"
  end

  create_table "words", :force => true do |t|
    t.text     "text"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.text     "notes"
    t.text     "valsi_type"
  end

end
