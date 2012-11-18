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

ActiveRecord::Schema.define(:version => 20121118110518) do

  create_table "microposts", :force => true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "microposts", ["user_id", "created_at"], :name => "index_microposts_on_user_id_and_created_at"

  create_table "playlists", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
    t.boolean  "can_delete"
    t.boolean  "can_add"
  end

  create_table "playlists_songs", :id => false, :force => true do |t|
    t.integer "song_id"
    t.integer "playlist_id"
  end

  add_index "playlists_songs", ["playlist_id", "song_id"], :name => "index_playlists_songs_on_playlist_id_and_song_id"
  add_index "playlists_songs", ["song_id", "playlist_id"], :name => "index_playlists_songs_on_song_id_and_playlist_id"

  create_table "relationships", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "relationships", ["followed_id"], :name => "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], :name => "index_relationships_on_follower_id_and_followed_id", :unique => true
  add_index "relationships", ["follower_id"], :name => "index_relationships_on_follower_id"

  create_table "scrapers", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "songs", :force => true do |t|
    t.string   "title"
    t.string   "artwork_url"
    t.string   "upload_date"
    t.boolean  "downloadable"
    t.integer  "duration"
    t.string   "genre"
    t.integer  "upload_id"
    t.string   "url"
    t.string   "server_plays"
    t.string   "purchase_url"
    t.boolean  "streamable"
    t.text     "tag_list"
    t.string   "track_type"
    t.string   "uri"
    t.integer  "user_upload_id"
    t.string   "service"
    t.string   "stream_url"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",               :default => false
    t.integer  "current_playlist_id", :default => 0
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
