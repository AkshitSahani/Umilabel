class RewardsController < ApplicationController
  def index
    @campaign = Campaign.find(params[:campaign_id])
    @rewards = @campaign.rewards
    @updated_rewards = @rewards.map { |r| [r.client, r.percentage - r.pledges.sum(:percentage_pledged)] }
    @total_pledged = @campaign.pledges.sum(:percentage_pledged)
    @updated_rewards << ['sold', @total_pledged]

    render json: @updated_rewards



    # Right now: [["Foo", 12], ["Bar", 45]]
    # What it should look like: { "current": [["Foo", 12], ["Bar", 15]], "total": [["Foo", 12], ["Bar", 30]] }
  end
end
