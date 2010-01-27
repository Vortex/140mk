class UsersController < ApplicationController
  before_filter :authenticate, :except => :index

  def index
    @users = User.paginate :per_page => G140[:users_per_page], :page => params[:page], :order => 'id DESC'
  end

  def show
    if (user = User.find_by_screen_name(params[:id]))
      @tweets = user.tweets.paginate :per_page => G140[:my_tweets_per_page], :page => params[:page]
    else
      render :file => "#{RAILS_ROOT}/public/404.html", :status => 404
    end
  end

  def deactivate
    
  end

  def destroy
    current_user.deactivate!
    reset_session
    redirect_to root_path
  end
end
