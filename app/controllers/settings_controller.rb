class SettingsController < ApplicationController
  before_filter :authenticate

  def index
    @subscriptions = current_user.subscriptions.paginate :per_page => 10, :page => params[:page], :include => [:user, :list]
    @lists = List.find(:all, :order => 'name ASC').map{|l| [l.name, l.id]}.unshift(['Select category', ''])
    @selected_lists = current_user.subscriptions.map{|s| s.list_id}
  end
end
