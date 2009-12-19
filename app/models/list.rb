class List < ActiveRecord::Base
  has_many :subscriptions
  has_many :users, :through => :subscriptions

  def self.last_tweets_on_most_subscribed_lists(tweets_limit, lists_limit)
    lists = find :all,
      :select => 'lists.name, COUNT(lists.id) as count',
      :joins => :subscriptions,
      :group => "subscriptions.list_id",
      :limit => lists_limit,
      :order => 'count ASC'

    twitter_auth = TwitterHttpAuth.new
    lists_tweets = {}
    lists.each{|l| lists_tweets[l.name] = twitter_auth.base.list_timeline(twitter_auth.username, l.name, :per_page => tweets_limit)}
    lists_tweets
  end
end
