# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include Twitter::AuthenticationHelpers

  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Filters
  before_filter :load_configuration

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password

  private

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
      @trending_tags = Tag.trending_from(from_when)
    else
      @trending_tags = Tag.trending_tags
    end

  end

  def load_configuration
    @configuration = Configuration.first
  end

end
