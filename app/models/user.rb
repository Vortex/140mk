class User < ActiveRecord::Base
  attr_accessible :atoken, :asecret

  has_many :subscriptions
  has_many :lists, :through => :subscriptions

  after_create :follow_user
  
  def authorized?
    atoken.present? && asecret.present?
  end
  
  def oauth
    @oauth ||= Twitter::OAuth.new(ConsumerConfig['consumer']['token'], ConsumerConfig['consumer']['secret'])
  end
  
  delegate :request_token, :access_token, :authorize_from_request, :to => :oauth
  
  def client
    @client ||= begin
      oauth.authorize_from_access(atoken, asecret)
      Twitter::Base.new(oauth)
    end
  end

  def self.create_or_update(profile, oauth)
    user = User.find_by_screen_name(profile.screen_name) || User.new
    user.screen_name = profile.screen_name
    user.twitter_id = profile.id
    user.twitter_account_created = profile.created_at
    user.name = profile.name
    user.location = profile.location
    user.url = profile.url
    user.photo = profile.profile_image_url
    user.description = profile.description
    user.atoken = oauth.access_token.token
    user.asecret = oauth.access_token.secret
    user.is_active? ? user.save : user.activate!
    user
  end

  def activate!
    self.is_active = true
    self.save!
    follow_user
  end

  def deactivate!
    self.is_active = false
    self.save!
    unfollow_user
  end

  private

  def follow_user
    unless TWITTER_HTTP_AUTH.friendship_exists?(TWITTER_HTTP_AUTH.username, screen_name)
      TWITTER_HTTP_AUTH.friendship_create(twitter_id, true)
    end
  end

  def unfollow_user
    if TWITTER_HTTP_AUTH.friendship_exists?(TWITTER_HTTP_AUTH.username, screen_name)
      TWITTER_HTTP_AUTH.friendship_destroy(twitter_id)
    end
  end
end
