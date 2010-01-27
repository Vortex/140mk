class SubscriptionsController < ApplicationController
  before_filter :authenticate

  def create
    categories = params[:lists].reject{|k, v| v.blank? }

    if categories.length <= G140[:max_lists]
      current_user.subscriptions = categories.map do |k, v|
        current_user.subscriptions.find_or_create_by_list_id(v)
      end
      flash[:notice] = t('subscriptions.create.notice')
    else
      flash[:error] = t('subscriptions.create.error', :count => G140[:max_lists]) 
    end

    redirect_to settings_url
  end

  def destroy
    @subscription = current_user.subscriptions.find(params[:id])
    @subscription.destroy
    flash[:notice] = "Your subscriptions was successfully removed."
    redirect_to settings_url
  end
end
