class RewardsController < ApplicationController
  def index
    @campaign = Campaign.find(params[:campaign_id])
    @rewards = @campaign.rewards
    render json: @rewards.pluck(:client, :percentage)
  end
end
