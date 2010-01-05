class UsersController < ApplicationController
  before_filter :authenticate, :except => :index

  def index
    @users = User.paginate :per_page => 1, :page => params[:page], :order => 'created_at DESC'
  end

  def destroy
    current_user.deactivate!
    reset_session
    redirect_to root_path
  end
end
