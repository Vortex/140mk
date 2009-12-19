class WelcomeController < ApplicationController
  def index
    lists = List.most_subscribed_lists(2)
    twitter_auth = TwitterHttpAuth.new
    @lists_tweets = twitter_auth.tweets_from_lists(lists, 10)
    @lists_members = twitter_auth.members_from_lists(lists)
  end
end
