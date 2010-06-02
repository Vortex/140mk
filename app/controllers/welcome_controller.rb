class WelcomeController < ApplicationController
  before_filter :get_filtered_tweets, :only => :index

  def index
    @lists = List.most_subscribed_lists(G140[:front_page_lists_count])
    @lists_tweets = {}
    @lists_users = {}

    @lists.each do |list|
      @lists_users[list.name] = list.users.find :all, :limit => G140[:users_per_list], :conditions => "status = 1", :order => "id DESC"
      @lists_tweets[list.name] = list.tweets.find :all, :limit => G140[:tweets_per_list], :order => "tweets.original_tweet_id DESC", :include => :user
    end

    if current_user && current_user.status == 2 # notify user that has protected his account
      flash[:error] = t("user.errors.private_account", :user => ConsumerConfig['user']['username'])
    end
  end

  def error
  end
end
