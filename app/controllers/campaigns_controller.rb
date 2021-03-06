class CampaignsController < ApplicationController
  before_action :load_campaign, only: [:show, :edit, :update, :destroy]
  before_action :user_signed_in?, only: [:new, :create, :edit, :update, :destroy]

  def index
    @campaigns = Campaign.all
    if params[:search]
      @campaigns = Campaign.search(params[:search])
      @users = User.search(params[:search])
    end
      respond_to do |format|
        format.html { render :layout => false if request.xhr? }
        format.json { render json: @users }
    end
  end

  def show
  end

  def new
    @campaign = Campaign.new
    @campaign.rewards.build
  end

  def edit

  end

  def create
    @campaign = Campaign.new(campaign_params)
    @campaign.owner_id = current_user.id
    if @campaign.save
       @purchasable_shares = Reward.new(campaign_id: @campaign.id, client: "Investors", percentage: @campaign.purchasable_shares)
       @purchasable_shares.save
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
    params.require(:campaign).permit(:title, :description, :owner_id, :share_price, :avatar, :background_image, :album_cover, :video_link, :document_1, :document_2, :document_3, :owner_shares, :purchasable_shares,
    :total_shares_num, rewards_attributes: [:id, :campaign_id, :client, :percentage, :confirmed, :_destroy])
  end

  def load_campaign
    @campaign = Campaign.find(params[:id])
  end

end
