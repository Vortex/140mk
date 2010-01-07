class WelcomeController < ApplicationController

  before_filter :get_filtered_tweets, :only => :index

  def index
    @lists = List.most_subscribed_lists(G140[:front_page_lists_count])
    @lists_tweets = {}
    @lists_users = {}
    @lists.each do |list|
      @lists_users[list.name] = list.users.find :all, :limit => G140[:users_per_list], :order => "id DESC"
      @lists_tweets[list.name] = Tweet.find :all, :limit => G140[:tweets_per_list], :order => "tweet_id DESC", 
        :conditions => ["user_id IN (SELECT `users`.id FROM `users` 
          INNER JOIN `subscriptions` ON `users`.id = `subscriptions`.user_id 
          WHERE ((`subscriptions`.list_id = ?)))", list.id],
        :include => :user
    end

    if current_user && current_user.status == 2 # notify user that has protected his account
      flash[:error] = t("user.errors.private_account", :user => TWITTER_HTTP_AUTH.username)
    end
  end

  def error
  end

  private

  def get_filtered_tweets
    @filtered_tweets = Tweet.find(:all, :conditions => ["text like ?", "%#fail%"], :order => 'tweet_id DESC')
  end


end
