class TagsController < ApplicationController
  before_filter :get_filtered_tweets, :only => :index
  before_filter :get_trending_tags, :only => [:index, :show]

  def index
    @tags = Tag.paginate :per_page => G140[:tags_per_page], :page => params[:page],
                         :select => 'tags.id, tags.name, COUNT(*) as count', :joins => :taggings,
                         :group => 'tags.name', :order => 'count DESC'
  end

  def show
    @tag = Tag.find(params[:id])

    @tweets = @tag.tweets.paginate :page => params[:page], :per_page => G140[:tweets_per_tag], :order => 'tweets.original_tweet_id DESC', :include => :user
    @users = User.paginate :page => params[:page], :per_page => G140[:users_per_tag], :joins => {:tweets => {:taggings => :tag}}, :conditions => ["tags.name = ?", @tag.name], :group => "users.screen_name", :order => "users.id DESC"

    respond_to do |format|
      format.html
      format.js do
        render :json => {
          :tweets => render_to_string(:partial => 'shared/tweet', :collection => @tweets, :locals => { :name => @tag.id }),
          :users => render_to_string(:partial => 'shared/user', :collection => @users, :locals => { :name => @tag.id })
        }.to_json
      end
    end
  end

  def by_period
    period = params[:period]

    unless (period == "archive") or (period.nil?)
      from_when = period.to_i
      @trending_tags = Tag.trending_from(from_when.days.ago)
      session[:trending_from] = from_when
    else
      @trending_tags = Tag.trending_tags
      session[:trending_from] = 0
    end

    response = render_to_string :partial => 'shared/trending_topics'
    render :text => response
  end

end
