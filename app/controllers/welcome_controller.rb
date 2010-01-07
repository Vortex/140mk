class WelcomeController < ApplicationController
  def index
    lists = List.most_subscribed_lists(G140[:front_page_lists_count])
    @lists_tweets = {}
    @lists_members = {}

    if current_user && current_user.status == 2 # user has protected his account
      flash[:error] = t("user.errors.private_account", :user => TWITTER_HTTP_AUTH.username)
    end

  end

  def error
    
  end
end
