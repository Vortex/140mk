class ListsController < ApplicationController
  def index
    @lists = List.paginate :per_page => 1, :page => params[:page], :order => 'created_at DESC'
  end
end
