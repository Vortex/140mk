class UsersController < ApplicationController
  def index
    @users = User.paginate :per_page => 1, :page => params[:page], :order => 'created_at DESC'
  end
end
