class SubscriptionController < ApplicationController
  before_action :load_subscription, only: [:show, :edit, :update, :destroy]

  def index
    #code
  end

  def show
    #code
  end

  def new
    #code
  end

  def create
    #code
  end

  def destroy
    #code
  end

  private
  def subscription_params
    params.require(:subscription).permit(:subscribee_id, :subscribed_to_id)
  end

  def load_subscription
    @subscription = Subscription.find(params[:id])
  end

end
