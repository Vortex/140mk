class UsersController < ApplicationController
  before_filter :authenticate, :only => :show

  def index
    @users = User.paginate :per_page => 1, :page => params[:page], :order => 'created_at DESC'
  end

end
