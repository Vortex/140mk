class WelcomeController < ApplicationController
  def index
    lists = List.most_subscribed_lists(G140[:front_page_lists_count])
    @lists_tweets = TWITTER_HTTP_AUTH.tweets_from_lists(lists, G140[:front_page_tweets_per_list])
    @lists_members = TWITTER_HTTP_AUTH.members_from_lists(lists)
  end
end
