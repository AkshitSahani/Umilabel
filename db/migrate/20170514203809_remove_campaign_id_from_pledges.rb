class RemoveCampaignIdFromPledges < ActiveRecord::Migration[5.0]
  def change
    remove_column :pledges, :campaign_id, :integer
  end
end
