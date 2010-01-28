class UsersController < ApplicationController
  before_filter :authenticate, :except => :index

  def index
    @users = User.paginate :per_page => G140[:users_per_page], :page => params[:page], :conditions => "status = 1", :order => 'id DESC'
  end

  def show
    user = User.find(:first, :conditions => ["screen_name = ? AND status = 1", params[:id]])
    @tweets = user.tweets.paginate :per_page => G140[:my_tweets_per_page], :page => params[:page]
  rescue
    render :file => "#{RAILS_ROOT}/public/404.html", :status => 404
  end

  def deactivate
    
  end

  def destroy
    current_user.deactivate!
    reset_session
    redirect_to root_path
  end
end
