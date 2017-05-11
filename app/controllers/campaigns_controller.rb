class CampaignsController < ApplicationController
  before_action :load_campaign, only: [:show, :edit, :update, :destroy]

  def index
    @campaigns = Campaign.all
  end

  def show

  #   if current_user
  #  @review = @campaign.reviews.build
  # end
  end

  def new
    @campaign = Campaign.new
    #investigate on the line below
    # @campaign.rewards.build if !@campaign.rewards.any?
  end

  def edit

  end

  def create
    @campaign = Campaign.new(campaign_params)

    if @campaign.save
      redirect_to campaign_url(@campaign)
    else
      render :new
    end
  end

  def update

    if @campaign.update_attributes(campaign_params)
      redirect_to campaign_url(@campaign)
    else
      render :edit
    end
  end

  def destroy
    @campaign.destroy
    redirect_to campaigns_url
  end

  private
  def campaign_params
    params.require(:campaign).permit(:title, :description, :owner_id, :share_price,
    rewards_attributes: [:campaign_id, :client, :percentage, :confirmed, :_destroy])
  end

  def load_campaign
    @campaign = Campaign.find(params[:id])
  end

end
