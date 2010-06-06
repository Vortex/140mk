module TwitterAccess
  extend self

  def base
    @base ||= authenticate(ConsumerConfig['user']['username'], ConsumerConfig['user']['password'])
  end

  def save_tweets(tweets)
    Tweet.transaction do
      tweets.each do |tweet|
        user = User.find_by_twitter_id(tweet.user.id, :select => "users.id, categories.id, subscriptions.user_id, subscriptions.category_id", :include => :categories)
        tweet = Tweet.create(:user => user, :original_tweet_id => tweet.id, :text => tweet.text, :created_at => tweet.created_at)
        user.categories.each do |category|
          category.tweets << tweet
        end
      end
    end
  end

  def get_tweets
    last_tweet = Tweet.find(:first, :order => "original_tweet_id DESC")

    if last_tweet # when there are tweets in the database collect only new ones
      page = 1
      begin
        tweets = base.friends_timeline({:count => 200, :page => page, :since_id => last_tweet.original_tweet_id})
        save_tweets(tweets)
        page += 1
      end while tweets.length > 0
    else # when there are no tweets in database, collect initial ones
      tweets = base.friends_timeline({:count => 200, :page => 1})
      save_tweets(tweets)
    end
  end

  def save_users(profiles)
    profiles.each do |profile|
      user = User.find_or_initialize_by_screen_name(profile.screen_name)
      user.set_profile_data(profile)
      user.save
    end
  end

  def get_users
    cursor = -1
    begin
      results = base.friends({:cursor => cursor})
      cursor = results.next_cursor
      save_users(results.users)
    end while cursor > 0
  end

  private
  def authenticate(username, password)
    httpauth = Twitter::HTTPAuth.new(username, password)
    Twitter::Base.new(httpauth)
  end
end
