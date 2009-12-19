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

  private
  def authenticate
    httpauth = Twitter::HTTPAuth.new(@username, @password)
    Twitter::Base.new(httpauth)
  end
end

