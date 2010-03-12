class TweetsController < ApplicationController
  before_filter :authenticate
  
  def index
    @tweets = Tweet.paginate :per_page => G140[:tweets_per_page], :page => params[:page]
  end

  def my
    @tweets = current_user.tweets.paginate :per_page => G140[:my_tweets_per_page], :page => params[:page]
  end

  def create
    current_user.client.update("blah blah")
  end

end
