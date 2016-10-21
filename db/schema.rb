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

ActiveRecord::Schema.define(version: 20161019041135) do

  create_table "admins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "hotel_id"
    t.string   "provider"
    t.string   "uid"
    t.index ["email"], name: "index_admins_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  end

  create_table "bookings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "check_in_date"
    t.datetime "check_out_date"
    t.integer  "number_of_children"
    t.integer  "number_of_guest"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "admin_id"
    t.integer  "room_type_id"
  end

  create_table "hotels", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "number_of_rooms"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "room_availabilities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "from"
    t.datetime "to"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "room_type_id"
    t.integer  "availability"
  end

  create_table "room_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "room_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "description"
    t.integer  "admin_id"
    t.integer  "availability"
    t.string   "availabilty"
  end

  create_table "rooms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "room_number"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "room_type_select"
    t.integer  "admin_id"
  end

  create_table "sidekiq_jobs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "jid"
    t.string   "queue"
    t.string   "class_name"
    t.text     "args",        limit: 65535
    t.boolean  "retry"
    t.datetime "enqueued_at"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.string   "status"
    t.string   "name"
    t.text     "result",      limit: 65535
    t.index ["class_name"], name: "index_sidekiq_jobs_on_class_name", using: :btree
    t.index ["enqueued_at"], name: "index_sidekiq_jobs_on_enqueued_at", using: :btree
    t.index ["finished_at"], name: "index_sidekiq_jobs_on_finished_at", using: :btree
    t.index ["jid"], name: "index_sidekiq_jobs_on_jid", using: :btree
    t.index ["queue"], name: "index_sidekiq_jobs_on_queue", using: :btree
    t.index ["retry"], name: "index_sidekiq_jobs_on_retry", using: :btree
    t.index ["started_at"], name: "index_sidekiq_jobs_on_started_at", using: :btree
    t.index ["status"], name: "index_sidekiq_jobs_on_status", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
    t.integer  "role"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
