class WelcomeController < ApplicationController
  def index
    lists = List.most_subscribed_lists(G140[:front_page_lists_count])
    @lists_tweets = {}
    @lists_members = {}
  end

  def error
    
  end
end
