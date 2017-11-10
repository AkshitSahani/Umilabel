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

    if current_user.stripe_customer_id

      charge = Stripe::Charge.create(
        :customer    => current_user.stripe_customer_id,
        :amount      => @amount,
        :description => 'Rails Stripe customer',
        :currency    => 'cad'
      )
    else
      customer = Stripe::Customer.create(
        :email => current_user.email,
        :source  => params[:stripeToken]
      )

      current_user.update_attributes(stripe_customer_id: customer.id)

      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => (@charge * 100).to_i, #because stripe expects charges in cents
        :description => 'Rails Stripe customer',
        :currency    => 'cad'
      )
    end

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end
  end
end
