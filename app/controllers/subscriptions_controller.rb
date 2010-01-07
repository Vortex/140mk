class SubscriptionsController < ApplicationController
  before_filter :authenticate

  def index
    @subscriptions = current_user.subscriptions.paginate :per_page => 10, :page => params[:page], :include => [:user, :list]
    @lists = List.find(:all, :order => 'name ASC').map{|l| [l.name, l.id]}.unshift(['Select category', ''])
    @selected_lists = current_user.subscriptions.map{|s| s.list_id}
  end

  def create
    categories = params[:lists].reject{|k, v| v.blank? }

    if categories.length <= G140[:max_lists]
      current_user.subscriptions = categories.map do |k, v|
        current_user.subscriptions.find_or_create_by_list_id(v)
      end
      flash[:notice] = t('subscriptions.create.notice')
      redirect_to subscriptions_url
    else
      flash[:error] = t('subscriptions.create.error', :count => G140[:max_lists]) 
      redirect_to subscriptions_url
    end
  end

  def destroy
    @subscription = current_user.subscriptions.find(params[:id])
    @subscription.destroy
    flash[:notice] = "Your subscriptions was successfully removed."
    redirect_to subscriptions_url
  end
end
