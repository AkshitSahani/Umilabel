class RewardsController < ApplicationController
  def index
    @campaign = Campaign.find(params[:campaign_id])
    @rewards = @campaign.rewards
    @updated_rewards = @rewards.map { |r| [r.client, r.percentage - r.pledges.sum(:percentage_pledged)] }
    @total_pledged = @campaign.pledges.sum(:percentage_pledged)
    @updated_rewards << ['Umilabel', 8]
    # @updated_rewards << ['Sold', @total_pledged]

    render json: @updated_rewards
  end
end
