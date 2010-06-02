class ListsController < ApplicationController
  before_filter :authenticate, :only => :create_on_twitter
  before_filter :get_filtered_tweets, :only => :index

  def index
    # @lists = List.ordered_by_subscriptions.paginate :per_page => G140[:categories_per_page], :page => params[:page]
    @lists = List.paginate :per_page => G140[:categories_per_page], :page => params[:page], :order => 'subscriptions_count desc'
  end

  def show
    @list = List.find(params[:id])
    @tweets = @list.tweets.paginate :page => params[:page], :per_page => G140[:tweets_per_list], :order => 'tweets.original_tweet_id DESC', :include => :user
    @users = @list.users.paginate :page => params[:page], :per_page => G140[:users_per_list]

    respond_to do |format|
      format.html
      format.js do
        render :json => {
          :tweets => render_to_string(:partial => 'shared/tweet', :collection => @tweets, :locals => { :name => @list.id }),
          :users => render_to_string(:partial => 'shared/user', :collection => @users, :locals => { :name => @list.id })
        }.to_json
      end
    end
  end

  def create_on_twitter
    redirect_to :back if params[:name].blank?
    mode = params[:mode] == "1" ? "private" : "public"

    list = List.find(params[:id])
    # create new list
    tlist = current_user.client.list_create(current_user.screen_name, {:name => params[:name], :mode => mode, :description => "#{params[:name]} (#{G140[:site_name]})"})

    users = list.users.find(:all, :select => "twitter_id")
    # add people to that list
    users.each { |user| current_user.client.list_add_member(current_user.screen_name, tlist.slug, user.twitter_id) }

    flash[:notice] = t('twitter.list.create.notice')
    redirect_to :back
  end
end
