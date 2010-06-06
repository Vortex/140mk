class SubscriptionsController < ApplicationController
  before_filter :authenticate

  def create
    @category = Category.find(params[:category_id])
    @subscription = current_user.subscriptions.new(:category => @category)
    @subscription.save

    respond_to do |format|
      format.js { render :text => "ok"}
    end
  end

  def destroy
    @subscription = current_user.subscriptions.first(:conditions => ["category_id = ?", params[:id]])
    @subscription.destroy
    respond_to do |format|
      format.js { render :text => "ok"}
    end
  end
end
