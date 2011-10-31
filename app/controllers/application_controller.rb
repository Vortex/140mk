require 'twitter/authentication_helpers'
class ApplicationController < ActionController::Base
  include Twitter::AuthenticationHelpers

  helper :all
  protect_from_forgery
  # rescue_from Twitter::Unauthorized, :with => :force_sign_in

  # Helper methods
  helper_method :current_user

  # Filters
  before_filter :load_configuration

  def current_user
    User.find_by_screen_name(session[:screen_name])
  end

private

  #def oauth_consumer
    #@auth_consumer ||= OAuth::Consumer.new(ConsumerConfig['consumer']['token'], ConsumerConfig['consumer']['secret'], :site => 'http://api.twitter.com', :request_endpoint => 'http://api.twitter.com', :sign_in => true)
  #end

  def client
    Twitter.configure do |config|
      config.consumer_key = ConsumerConfig['consumer']['token']
      config.consumer_secret = ConsumerConfig['consumer']['secret']
      config.oauth_token = session['access_token']
      config.oauth_token_secret = session['access_secret']
    end
    @client ||= Twitter::Client.new
  end
  helper_method :client

  def get_filtered_tweets
    @filtered_tweets = Tweet.find(:all, :conditions => ["text like ?", "%#{@configuration.try(:today_topic)}%"], :order => 'original_tweet_id DESC', :limit => G140[:tweets_per_hashtag], :include => :user)
  end

  def get_trending_tags
    unless session[:trending_from].nil?
      from_when = session[:trending_from]
    else
      from_when = G140[:default_trending_filter]
    end

    unless from_when == 0
      @trending_tags = Tag.trending_from(from_when.day.ago)
    else
      @trending_tags = Tag.trending_tags
    end
  end

  def load_configuration
    @configuration = Configuration.first
  end

  def force_sign_in(exception)
    reset_session
    flash[:error] = "It seems your credentials are not good anymore. Please sign in again."
    # redirect_to root_path
  end
end
