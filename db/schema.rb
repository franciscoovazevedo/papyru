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

ActiveRecord::Schema.define(version: 20170828153241) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "channels", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status"
    t.integer  "study_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["study_id"], name: "index_channels_on_study_id", using: :btree
  end

  create_table "documents", force: :cascade do |t|
    t.string   "filetype"
    t.integer  "message_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.string   "file"
    t.index ["message_id"], name: "index_documents_on_message_id", using: :btree
  end

  create_table "mayor_subjects", force: :cascade do |t|
    t.integer  "mayor_id"
    t.integer  "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mayor_id"], name: "index_mayor_subjects_on_mayor_id", using: :btree
    t.index ["subject_id"], name: "index_mayor_subjects_on_subject_id", using: :btree
  end

  create_table "mayors", force: :cascade do |t|
    t.string   "name"
    t.string   "acronym"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "channel_id"
    t.integer  "user_id"
    t.string   "content"
    t.boolean  "identity",   default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["channel_id"], name: "index_messages_on_channel_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "message_id"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "addressee"
    t.index ["message_id"], name: "index_notifications_on_message_id", using: :btree
    t.index ["user_id"], name: "index_notifications_on_user_id", using: :btree
  end

  create_table "studies", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "teacher_id"
    t.integer  "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_student_subjects_on_student_id", using: :btree
    t.index ["subject_id"], name: "index_student_subjects_on_subject_id", using: :btree
    t.index ["teacher_id"], name: "index_student_subjects_on_teacher_id", using: :btree
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.string   "acronym"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "name"
    t.string   "address"
    t.string   "phone_number"
    t.string   "school_number"
    t.string   "photo"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "mayor_id"
    t.string   "type"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "channels", "studies"
  add_foreign_key "documents", "messages"
  add_foreign_key "mayor_subjects", "mayors"
  add_foreign_key "mayor_subjects", "subjects"
  add_foreign_key "messages", "channels"
  add_foreign_key "messages", "users"
  add_foreign_key "notifications", "messages"
  add_foreign_key "notifications", "users"
end
