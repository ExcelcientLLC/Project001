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

ActiveRecord::Schema.define(:version => 20120930220222) do

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.text     "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "goal_categories", :force => true do |t|
    t.string   "name"
    t.binary   "icon"
    t.integer  "priority"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "goals", :force => true do |t|
    t.datetime "target_date"
    t.integer  "target_value"
    t.integer  "current_value"
    t.integer  "target_expenditures"
    t.integer  "current_expenditures"
    t.boolean  "complete"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "goal_category_id"
    t.integer  "visit_id"
  end

  create_table "to_dos", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.boolean  "complete"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "visit_id"
  end

  create_table "visits", :force => true do |t|
    t.date     "visit_date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "client_id"
  end

end
