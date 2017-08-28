class ChargesController < ApplicationController

  def new
    if request.xhr?
      @campaign = Campaign.find(params['campaign_id'])
      @amount = @campaign.share_price * 100
    end
  end

  def create
    # Amount in cents
    @amount = Campaign.get_share_price.to_i * 100

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

end
