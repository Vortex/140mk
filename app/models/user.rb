class User < ActiveRecord::Base

  attr_accessible :atoken, :asecret

  # Associations
  has_many :subscriptions, :dependent => :destroy
  has_many :categories, :through => :subscriptions
  has_many :tweets

  # Validations
  validates_presence_of :screen_name

  # Callbacks
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

  def has_subscriptions?
    subscriptions.count > 0
  end

  def follows_user?(some_user)
    logger.info screen_name
    logger.info some_user.screen_name
    return TwitterAccess.base.friendship_exists?(screen_name, some_user.screen_name)
  end

  def set_profile_data(account)
    self.twitter_id = account.id
    self.twitter_account_created_at = account.created_at
    self.name = account.name
    self.location = account.location
    self.url = account.url
    self.photo = account.profile_image_url
    self.description = account.description
  end

  def save_with_profile_and_oauth(profile, oauth)
    self.set_profile_data(profile)
    self.atoken = oauth.access_token.token
    self.asecret = oauth.access_token.secret
    self.status == 1 ? self.save : self.activate!
  end

  def activate!
    self.status = 1 # active
    self.save!
    follow_user
  end

  def deactivate!
    self.status = 0 # not active
    self.save!
    unfollow_user
  end

  # Not to be confused with follow_user method which is used by application internal
  # TODO: refactor this code to escape this confusion
  def follow(user)
    unless TwitterAccess.base.friendship_exists?(self.screen_name, user.screen_name)
      TwitterAccess.base.friendship_create(user.twitter_id, true)
    end
  end

  def to_param
    screen_name
  end

  private

  def follow_user
    return if Rails.env == "test" # don't follow users when in test environment

    unless TwitterAccess.base.friendship_exists?(ConsumerConfig['user']['username'], screen_name)
      TwitterAccess.base.friendship_create(twitter_id, true)
    end
  rescue Twitter::General => e
    if e.message =~ /\(403\): Forbidden .*/
      self.status = 2 # protected account
      self.save
    else
      raise e
    end
  end

  def unfollow_user
    if TwitterAccess.base.friendship_exists?(ConsumerConfig['user']['username'], screen_name)
      TwitterAccess.base.friendship_destroy(twitter_id)
    end
  end
end
