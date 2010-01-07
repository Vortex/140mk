ConsumerConfig = YAML.load(File.read(Rails.root + 'config' + 'twitter.yml'))

G140 = {
  :site_name => "140.mk",
  :front_page_lists_count => 4,
  :tweets_per_list => 20,
  :users_per_list => 10,
  :max_lists => 5,
  :my_tweets_per_page => 10,
  :tweets_per_page => 10,
  :categories_per_page => 10,
  :users_per_page => 10
}
