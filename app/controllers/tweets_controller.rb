class TweetsController < ApplicationController
  before_filter :authenticate
  
  def index
    params[:page] ||= 1
    @tweets = current_user.client.friends_timeline(:page => params[:page])
  end


  def my
    params[:page] ||= 1
    @tweets = current_user.client.user_timeline(:id => current_user.screen_name, :page => params[:page])
    @user = current_user.client.user(current_user.screen_name)
  end

end
