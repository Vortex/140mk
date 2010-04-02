class TweetsController < ApplicationController
  before_filter :authenticate, :except => :refresh
  
  def index
    @tweets = Tweet.paginate :per_page => G140[:tweets_per_page], :page => params[:page]

    respond_to do |format|
      format.html
      format.js { render :layout => false }
    end
  end

  def my
    @tweets = current_user.tweets.paginate :per_page => G140[:my_tweets_per_page], :page => params[:page]
  end

  def create
    content = params[:tweet]
    current_user.client.update(content)

    respond_to do |format|
      format.js
    end
  end

  def refresh
    @param = params[:list_id]
    if  @param == "fail"
      @tweets = Tweet.find(:all, :conditions => ["text like ? or text like ?", "%#fail%", "%#mkfail%"], :order => 'tweet_id DESC', :include => :user)
    else
      @list = List.find(params[:list_id])
      @tweets = @list.tweets.find :all, :limit => G140[:tweets_per_list], :order => "tweets.tweet_id DESC", :include => :user
    end

    respond_to do |format|
      format.js { render :layout => false}
    end
  end

end
