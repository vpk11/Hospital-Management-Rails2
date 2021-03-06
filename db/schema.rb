# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20170825065051) do

  create_table "add_department_id_to_users", :force => true do |t|
    t.integer  "department_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "appointments", :force => true do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "doctor_id"
    t.integer  "patient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bed_assignments", :force => true do |t|
    t.integer  "patient_id"
    t.integer  "bed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "start_time"
    t.datetime "end_time"
  end

  create_table "beds", :force => true do |t|
    t.string   "bed_number"
    t.integer  "ward_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departments", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.integer  "age"
    t.string   "phone_no"
    t.string   "username"
    t.string   "password_salt"
    t.string   "hashed_password"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "department_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "wards", :force => true do |t|
    t.string   "name"
    t.integer  "bed_space"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
