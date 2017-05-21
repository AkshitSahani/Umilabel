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

ActiveRecord::Schema.define(version: 20170521171025) do

  create_table "campaigns", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "owner_id"
    t.integer  "share_price"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "background_image_file_name"
    t.string   "background_image_content_type"
    t.integer  "background_image_file_size"
    t.datetime "background_image_updated_at"
    t.string   "document_1_file_name"
    t.string   "document_1_content_type"
    t.integer  "document_1_file_size"
    t.datetime "document_1_updated_at"
    t.string   "document_2_file_name"
    t.string   "document_2_content_type"
    t.integer  "document_2_file_size"
    t.datetime "document_2_updated_at"
    t.string   "document_3_file_name"
    t.string   "document_3_content_type"
    t.integer  "document_3_file_size"
    t.datetime "document_3_updated_at"
    t.string   "album_cover_file_name"
    t.string   "album_cover_content_type"
    t.integer  "album_cover_file_size"
    t.datetime "album_cover_updated_at"
    t.string   "video_link"
  end

  create_table "conversations", force: :cascade do |t|
    t.integer  "author_id"
    t.integer  "receiver_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["author_id"], name: "index_conversations_on_author_id"
    t.index ["receiver_id"], name: "index_conversations_on_receiver_id"
  end

  create_table "personal_messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "conversation_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "author_id"
    t.integer  "receiver_id"
    t.index ["author_id"], name: "index_personal_messages_on_author_id"
    t.index ["conversation_id"], name: "index_personal_messages_on_conversation_id"
    t.index ["receiver_id"], name: "index_personal_messages_on_receiver_id"
  end

  create_table "pledges", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "reward_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "percentage_pledged"
    t.boolean  "confirmed",          default: false
  end

  create_table "rewards", force: :cascade do |t|
    t.integer  "campaign_id"
    t.string   "client"
    t.integer  "percentage"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "subscribed_to_id"
    t.integer  "subscribee_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "username"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "password_digest"
    t.string   "studio_name"
    t.string   "description"
    t.string   "tags"
    t.string   "founded_in"
    t.string   "background_image_file_name"
    t.string   "background_image_content_type"
    t.integer  "background_image_file_size"
    t.datetime "background_image_updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

end
