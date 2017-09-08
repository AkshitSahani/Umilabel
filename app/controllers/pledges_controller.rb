class PledgesController < ApplicationController
before_action :load_pledge, only: [:show, :edit, :update, :destroy]
before_action :user_signed_in?

  def index
    if request.xhr?
      @campaign = Campaign.find(params['campaign_id'])
      @share_price = @campaign.share_price
      @total_shares_num = @campaign.total_shares_num
      @reward_id = @campaign.rewards.where(client: "Investors")[0].id
      respond_to do |format|
        format.html
        format.json { render json: [@reward_id, @share_price, @total_shares_num] }
      end
    end
  end

  def show
    #code
  end

  def new
    @pledge = Pledge.new

    if request.xhr?
      respond_to do |format|
        format.html { render :layout => false }
      end
    end
  end

  def create
    @pledge = Pledge.new(pledge_params)
    @pledge.save!
  end

  def edit
    #code
  end

  def update
    #code
  end

  def destroy
    @pledge.destroy
  end

  private
  def pledge_params
    params.require(:pledge).permit(:reward_id, :user_id, :percentage_pledged, :num_shares_pledged)
  end

  def load_pledge
    @pledge = Pledge.find(params[:id])
  end

end
