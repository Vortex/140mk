class WelcomeController < ApplicationController
  def index
    @lists_tweets = List.last_tweets_on_most_subscribed_lists(10, 2)
  end
end
