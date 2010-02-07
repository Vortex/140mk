class SubscriptionsController < ApplicationController
  before_filter :authenticate

  def create
    @list = List.find(params[:list_id])
    @subscription = current_user.subscriptions.new(:list => @list)
    @subscription.save

    respond_to do |format|
      format.js { render :text => "ok"}
    end
  end

  def destroy
    @subscription = current_user.subscriptions.first(:conditions => ["list_id = ?", params[:id]])
    @subscription.destroy
    respond_to do |format|
      format.js { render :text => "ok"}
    end
  end
end
