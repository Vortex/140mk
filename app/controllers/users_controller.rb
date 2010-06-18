class UsersController < ApplicationController
  before_filter :authenticate, :except => :index
  before_filter :get_filtered_tweets, :only => :index
  before_filter :get_trending_tags, :only => :index

  def index
    @users = User.paginate :per_page => G140[:users_per_page], :page => params[:page], :include => :categories, :conditions => "status = 1", :order => 'id DESC'
  end

  def deactivate
  end

  def destroy
    current_user.deactivate!
    reset_session
    redirect_to root_path
  end
end
