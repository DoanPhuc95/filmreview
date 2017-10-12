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

ActiveRecord::Schema.define(version: 20171012072829) do

  create_table "actor_movies", force: :cascade do |t|
    t.integer  "movie_id"
    t.integer  "actor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "actor_movies", ["actor_id"], name: "index_actor_movies_on_actor_id"
  add_index "actor_movies", ["movie_id"], name: "index_actor_movies_on_movie_id"

  create_table "actors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.integer  "value"
    t.integer  "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "categories", ["movie_id"], name: "index_categories_on_movie_id"

  create_table "comments", force: :cascade do |t|
    t.string   "content"
    t.integer  "movie_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["movie_id"], name: "index_comments_on_movie_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "movies", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "producer_id"
    t.string   "image"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "episode"
    t.integer  "year"
  end

  add_index "movies", ["producer_id"], name: "index_movies_on_producer_id"

  create_table "producers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rates", force: :cascade do |t|
    t.integer  "value"
    t.integer  "movie_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "rates", ["movie_id"], name: "index_rates_on_movie_id"
  add_index "rates", ["user_id"], name: "index_rates_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",     null: false
    t.string   "encrypted_password",     default: "",     null: false
    t.boolean  "admin",                  default: false
    t.string   "name",                                    null: false
    t.string   "gender",                 default: "Male"
    t.string   "avatar"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,      null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
