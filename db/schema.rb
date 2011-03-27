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

ActiveRecord::Schema.define(:version => 20110327132318) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "subscriptions_count", :default => 0
  end

  create_table "categories_tweets", :id => false, :force => true do |t|
    t.integer "category_id"
    t.integer "tweet_id"
  end

  add_index "categories_tweets", ["category_id", "tweet_id"], :name => "index_lists_tweets_on_list_id_and_tweet_id"

  create_table "configurations", :force => true do |t|
    t.string   "today_topic", :default => "#140mk"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "followings", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followed_user_id"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "poll_answers", :force => true do |t|
    t.integer  "poll_response_id"
    t.integer  "poll_question_id"
    t.integer  "poll_choice_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "poll_choices", :force => true do |t|
    t.integer  "poll_question_id"
    t.string   "name"
    t.integer  "poll_answers_count", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "poll_questions", :force => true do |t|
    t.integer  "poll_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "poll_responses", :force => true do |t|
    t.integer  "user_id"
    t.integer  "poll_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "polls", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "published",   :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscriptions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "tweet_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tweets", :force => true do |t|
    t.integer  "user_id"
    t.integer  "original_tweet_id", :limit => 8, :null => false
    t.string   "text"
    t.datetime "created_at"
  end

  add_index "tweets", ["original_tweet_id"], :name => "index_tweets_on_tweet_id"
  add_index "tweets", ["user_id"], :name => "index_tweets_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "screen_name"
    t.string   "email"
    t.string   "atoken"
    t.string   "asecret"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "twitter_id"
    t.datetime "twitter_account_created_at"
    t.string   "name"
    t.string   "location"
    t.string   "url"
    t.string   "photo"
    t.text     "description"
    t.integer  "status",                     :default => 1
    t.boolean  "is_admin",                   :default => false
  end

end
