ConsumerConfig = YAML.load(File.read(Rails.root + 'config' + 'twitter.yml'))

G140 = {
  :site_name => "140.мк (бета)",
  :front_page_categories_count => 6,
  :tweets_per_category => 5,
  :users_per_category => 5,
  :max_categories => 5,
  :my_tweets_per_page => 10,
  :tweets_per_page => 10,
  :categories_per_page => 18,
  :users_per_page => 10,
  :subscriptions_per_user => 6,
  :prod_account => '140mk',
  :today_topic => '#rmsmk'
}
