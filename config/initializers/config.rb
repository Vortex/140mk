# encoding: utf-8
ConsumerConfig = YAML.load(File.read(Rails.root + 'config' + 'twitter.yml'))

G140 = {
  :site_name => " | 140.mk (бета)",
  :front_page_categories_count => 6,
  :tweets_per_category => 5,
  :users_per_category => 5,
  :categories_per_page => 18,
  :tweets_per_tag => 5,
  :users_per_tag => 5,
  :tags_per_page => 18,
  :max_categories => 5,
  :my_tweets_per_page => 10,
  :tweets_per_page => 10,
  :users_per_page => 10,
  :subscriptions_per_user => 6,
  :prod_account => '140mk',
  :today_topic => '#svecko',
  :trends_count => 10,
  :tweets_per_hashtag => 5,
  :periodic_update_frequency => 30,
  :default_trending_filter => 1,
  :latest_version => "0.3.3"
}
