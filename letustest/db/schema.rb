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

ActiveRecord::Schema.define(:version => 20130706151126) do

  create_table "feedbacks", :force => true do |t|
    t.string   "url"
    t.text     "questions"
    t.string   "email"
    t.string   "numofbugs"
    t.datetime "duedate"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "telephone"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "payment_notifications", :force => true do |t|
    t.text     "params"
    t.integer  "feedback_id"
    t.string   "status"
    t.string   "transaction_id"
    t.string   "create"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "playgrounds", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "url"
    t.string   "country"
    t.text     "title"
    t.text     "reproduce"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "lastname"
    t.string   "contact_number"
    t.string   "company_name"
    t.string   "city"
    t.string   "country"
    t.string   "company_type"
    t.string   "zipcode"
    t.string   "address"
    t.string   "state"
    t.string   "timezone"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
