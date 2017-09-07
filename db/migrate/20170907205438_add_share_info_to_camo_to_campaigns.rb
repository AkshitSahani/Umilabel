class AddShareInfoToCamoToCampaigns < ActiveRecord::Migration[5.0]
  def change
    add_column :campaigns, :owner_shares, :decimal
    add_column :campaigns, :purchasable_shares, :decimal
  end
end
