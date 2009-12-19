class SubscriptionsController < ApplicationController

  def index
    @subscriptions = current_user.subscriptions.paginate :per_page => 10, :page => params[:page], :include => [:user, :list]
  end

  def new
    @subscription = Subscription.new
  end

  def create
    @subscription = current_user.subscriptions.new(params[:subscription])

    if @subscription.save
      flash[:notice] = 'Subscription was successfully created.'
      redirect_to subscriptions_url
    else
      render :action => "new"
    end
  end

  def destroy
    @subscription = current_user.subscriptions.find(params[:id])
    @subscription.destroy

    redirect_to subscriptions_url
  end
end
