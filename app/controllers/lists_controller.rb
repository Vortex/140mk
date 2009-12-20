class ListsController < ApplicationController
  def index
    @lists = List.paginate :per_page => 1, :page => params[:page], :order => 'created_at DESC'
  end

  def show
    @list = List.find_by_name(params[:id])
    @tweets = TWITTER_HTTP_AUTH.tweets_from_list(@list, G140[:side_page_tweets_per_list])
    @members = TWITTER_HTTP_AUTH.members_from_list(@list)
  end
end
