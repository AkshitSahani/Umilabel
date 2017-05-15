class AddVideoLinkToCampaigns < ActiveRecord::Migration[5.0]
  def change
    add_column :campaigns, :video_link, :string
  end
end
