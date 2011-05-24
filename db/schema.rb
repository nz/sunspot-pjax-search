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

ActiveRecord::Schema.define(:version => 20110524220356) do

  create_table "chapters", :force => true do |t|
    t.string   "description"
    t.integer  "chapter"
    t.integer  "section"
    t.integer  "chapter_id"
    t.integer  "work_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "characters", :force => true do |t|
    t.string   "char_id"
    t.string   "name"
    t.string   "abbrev"
    t.string   "description"
    t.integer  "speech_count"
    t.integer  "work_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "paragraphs", :force => true do |t|
    t.text     "plain_text"
    t.integer  "chapter_id"
    t.integer  "character_id"
    t.integer  "work_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "works", :force => true do |t|
    t.string   "work_id"
    t.string   "title"
    t.string   "long_title"
    t.integer  "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
