class AddTotalNumOfSharesToCampaign < ActiveRecord::Migration[5.0]
  def change
    add_column :campaigns, :total_shares_num, :decimal
  end
end
