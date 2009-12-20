# TODO Refactoring: caching functionallity + sinleton
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

  def tweets_from_lists(lists, limit)
    lists_tweets = {}
    lists.each{|l| lists_tweets[l.name] = base.list_timeline(username, l.name, :per_page => limit)}
    lists_tweets
  end

  def members_from_lists(lists)
    lists_members = {}
    lists.each{|l| lists_members[l.name] = base.list_members(username, l.name, -1).users.compact}
    lists_members
  end

  def refresh_lists_in_database
    base.lists(username).lists.each{ |l| List.find_or_create_by_name(l.name)}
  end

  private
  def authenticate
    httpauth = Twitter::HTTPAuth.new(@username, @password)
    Twitter::Base.new(httpauth)
  end
end

