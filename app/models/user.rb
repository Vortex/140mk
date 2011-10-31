class User < ActiveRecord::Base

  attr_accessible :atoken, :asecret

  # Associations
  has_many :subscriptions, :dependent => :destroy
  has_many :categories, :through => :subscriptions
  has_many :tweets
  has_many :followings
  has_many :poll_responses, :dependent => :destroy

  # Validations
  validates_presence_of :screen_name

  # Callbacks
  after_create :follow_user

  # Model can accept nested attributes
  accepts_nested_attributes_for :poll_responses, :allow_destroy => true

  def has_taken_poll?(poll)
    poll_responses.find(:first, :conditions => {:poll_id => poll.id})
  end

  def authorized?
    atoken.present? && asecret.present?
  end

  delegate :request_token, :access_token, :authorize_from_request, :to => :oauth

  def has_subscriptions?
    subscriptions.count > 0
  end

  def follows_user?(some_user)
    # check the cache first
    following = Following.find(:first, :conditions => { :follower_id => self.id, :followed_user_id => some_user.id })
    if following
      return following.status
    else
      # Create cached value
      status = TwitterAccess.client.friendship_exists?(screen_name, some_user.screen_name)
      Following.create(:follower_id => self.id, :followed_user_id => some_user.id, :status => status)

      return status
    end
  rescue Exception
    return true
  end

  def set_profile_data(account)
    # Check if there are more than one accounts connected to this screen name
    attached_users = User.where("twitter_id = ?", account.id)
    if attached_users.size > 1
      # Delete the duplicates
      attached_users.each do |user|
        unless user == attached_users.last
          puts "Deleting duplicate user: #{user.screen_name}"
          user.delete
        end
      end
    end
    self.twitter_id = account.id
    self.twitter_account_created_at = account.created_at
    self.name = account.name
    self.location = account.location
    self.url = account.url
    self.photo = account.profile_image_url
    self.description = account.description
  end

  def save_with_profile_and_oauth(profile, access_token)
    self.set_profile_data(profile)
    # self.atoken = access_token.token
    # self.asecret = access_token.secret
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
    unless TwitterAccess.client.friendship_exists?(self.screen_name, user.screen_name)
      TwitterAccess.client.friendship_create(user.twitter_id, true)
    end
  end

  def to_param
    screen_name
  end

  private

  def follow_user
    return if Rails.env == "test" # don't follow users when in test environment

    unless TwitterAccess.client.friendship_exists?(ConsumerConfig['user']['username'], screen_name)
      TwitterAccess.client.follow(twitter_id)
    end
  # rescue Twitter::General => e
  #  if e.message =~ /\(403\): Forbidden .*/
  #    self.status = 2 # protected account
  #    self.save
  #  else
  #    raise e
  #  end
  end

  def unfollow_user
    if TwitterAccess.client.friendship_exists?(ConsumerConfig['user']['username'], screen_name)
      TwitterAccess.client.unfollow(twitter_id)
    end
  end
end
