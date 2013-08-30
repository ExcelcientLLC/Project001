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

ActiveRecord::Schema.define(:version => 20130830173456) do

  create_table "clients", :force => true do |t|
    t.string   "first_name"
    t.string   "email"
    t.string   "phone"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.text     "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "last_name"
  end

  create_table "disclaimers", :force => true do |t|
    t.string   "name"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "goal_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "goal_states", :force => true do |t|
    t.integer  "current_value"
    t.integer  "current_expenditures"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "goal_id"
    t.integer  "visit_id"
  end

  create_table "goals", :force => true do |t|
    t.date     "target_date"
    t.integer  "target_value"
    t.integer  "target_expenditures"
    t.boolean  "complete"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "goal_category_id"
    t.string   "name"
    t.integer  "client_id"
  end

  create_table "to_do_states", :force => true do |t|
    t.boolean  "complete"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "to_do_id"
    t.integer  "visit_id"
  end

  create_table "to_dos", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "client_id"
  end

  create_table "visits", :force => true do |t|
    t.date     "visit_date"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "client_id"
    t.integer  "disclaimer_id"
  end

end
