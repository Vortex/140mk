class CategoriesController < ApplicationController
  before_filter :authenticate, :only => :create_on_twitter
  before_filter :get_filtered_tweets, :only => :index
  before_filter :get_trending_tags, :only => [:index, :show]

  def index
    @categories = Category.paginate :per_page => G140[:categories_per_page], :page => params[:page], :order => 'subscriptions_count desc'
  end

  def show
    @category = Category.find(params[:id])
    @tweets = @category.tweets.paginate :page => params[:page], :per_page => G140[:tweets_per_category], :order => 'tweets.original_tweet_id DESC', :include => :user
    @users = @category.users.paginate :page => params[:page], :per_page => G140[:users_per_category], :order => 'users.id DESC'

    respond_to do |format|
      format.html
      format.js do
        render :json => {
          :tweets => render_to_string(:partial => 'shared/tweet', :collection => @tweets, :locals => { :name => @category.id }),
          :users => render_to_string(:partial => 'shared/user', :collection => @users, :locals => { :name => @category.id })
        }.to_json
      end
    end
  end

  def create_on_twitter
    redirect_to :back if params[:name].blank?
    mode = params[:mode] == "1" ? "private" : "public"

    category = Category.find(params[:id])
    # create new list
    tlist = current_user.client.list_create(current_user.screen_name, {:name => params[:name], :mode => mode, :description => "#{params[:name]} (#{G140[:site_name]})"})

    users = category.users.find(:all, :select => "twitter_id")
    # add people to that list
    users.each { |user| current_user.client.list_add_member(current_user.screen_name, tlist.slug, user.twitter_id) }

    flash[:notice] = t('twitter.list.create.notice')
    redirect_to :back
  end
end
