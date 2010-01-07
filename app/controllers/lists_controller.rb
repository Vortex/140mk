class ListsController < ApplicationController
  def index
    @lists = List.paginate :per_page => G140[:categories_per_page], :page => params[:page], :order => 'created_at DESC'
  end

  def show
    @list = List.find(params[:id])
    @tweets = Tweet.find :all, :limit => G140[:tweets_per_list], :order => 'tweet_id DESC', :include => :user
    @users = @list.users.find :all, :limit => G140[:users_per_list]
  end
end
