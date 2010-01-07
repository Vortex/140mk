ConsumerConfig = YAML.load(File.read(Rails.root + 'config' + 'twitter.yml'))

class TwitterHttpAuth
  def initialize
    @username = ConsumerConfig['user']['username']
    @password = ConsumerConfig['user']['password']
    @base = authenticate
  end

  def base
    @base
  end

  def username
    @username
  end

  def save_tweets(tweets)
    tweets.each do |tweet|
      Tweet.create(
        :user => User.find_by_twitter_id(tweet.user.id),
        :tweet_id => tweet.id,
        :text => tweet.text,
        :created_at => tweet.created_at
      )
    end
  end

  def get_tweets
    last_tweet = Tweet.find(:first, :order => "tweet_id DESC")

    if last_tweet # when there are tweets in the database collect only new ones
      page = 1
      begin
        tweets = base.friends_timeline({:count => 200, :page => page, :since_id => last_tweet.tweet_id})
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
      user.set_attributes_from_twitter_account(profile)
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

  def method_missing(m, *args, &block)
    if base.respond_to? m.to_sym
      base.send m, *args, &block
    else
      raise NoMethodError
    end
  end

  private
  def authenticate
    httpauth = Twitter::HTTPAuth.new(@username, @password)
    Twitter::Base.new(httpauth)
  end

  public
  @@instance = TwitterHttpAuth.new

  def self.instance
    return @@instance
  end
  private_class_method :new
end

TWITTER_HTTP_AUTH = TwitterHttpAuth.instance
