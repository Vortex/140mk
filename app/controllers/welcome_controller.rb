class WelcomeController < ApplicationController
  before_filter :get_filtered_tweets, :only => :index
  before_filter :get_trending_tags, :only => :index

  def index
    @categories = Category.most_subscribed_categories(G140[:front_page_categories_count])
    @categories_tweets = {}
    @categories_users = {}

    @categories.each do |category|
      @categories_users[category.name] = category.users.find :all, :limit => G140[:users_per_category], :conditions => "status = 1", :order => "id DESC"
      @categories_tweets[category.name] = category.tweets.find :all, :limit => G140[:tweets_per_category], :order => "tweets.original_tweet_id DESC", :include => :user
    end

    if current_user && current_user.status == 2 # notify user that has protected his account
      flash[:error] = t("user.errors.private_account", :user => ConsumerConfig['user']['username'])
    end
  end

  def error
  end
end
