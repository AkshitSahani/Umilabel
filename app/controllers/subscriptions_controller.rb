class SubscriptionsController < ApplicationController
  before_action :load_subscription, only: [:show, :destroy]
  before_action :ensure_logged_in, only: [:new, :create, :destroy]

  def index

  end

  def show
    #code
  end

  def new
    @subscription = Subscription.new
  end

  def create
    if request.xhr?
      @subscription = Subscription.new(subscription_params)
      @existing_subscription = Subscription.where(subscribed_to_id: subscription_params["subscribed_to_id"]).where(subscribee_id: subscription_params["subscribee_id"])
      if @existing_subscription.empty?
        @subscription.save
      else
        @existing_subscription.destroy(@existing_subscription)
      end
    end
  end

  def destroy
    @subscription.destroy
  end

  private
  def subscription_params
    params.require(:subscription).permit(:subscribee_id, :subscribed_to_id)
  end

  def load_subscription
    @subscription = Subscription.find(params[:id])
  end

end
