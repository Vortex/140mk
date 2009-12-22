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

  def tweets_from_list(list, limit)
    base.list_timeline(username, list.name, :per_page => limit)
  rescue Twitter::NotFound
    []
  end

  def tweets_from_lists(lists, limit)
    lists_tweets = {}
    lists.each do |list|
      lists_tweets[list.name] = tweets_from_list(list, limit)
    end
    lists_tweets.reject{|k, v| v.empty?}
  end

  def members_from_list(list)
    base.list_members(username, list.name, -1).users.compact!
  rescue Twitter::NotFound
    []
  end

  def members_from_lists(lists)
    lists_members = {}
    lists.each do |list|
      lists_members[list.name] = members_from_list(list)
    end
    lists_members.reject{|k, v| v.empty?}
  end

  def update_lists_in_database_from_twitter
    base.lists(username).lists.each{ |list| List.find_or_create_by_name(list.name)}
  end

  def update_subscriptions_in_database_from_twitter
    List.all.each do |list|
      base.list_members(username, list.name).users.compact!.each do |u|
        user = User.find_or_create_by_screen_name(u.screen_name)
        Subscription.find_or_create_by_user_id_and_list_id(user.id, list.id)
      end
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
