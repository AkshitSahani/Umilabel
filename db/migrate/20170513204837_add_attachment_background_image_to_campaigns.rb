class AddAttachmentBackgroundImageToCampaigns < ActiveRecord::Migration
  def self.up
    change_table :campaigns do |t|
      t.attachment :background_image
    end
  end

  def self.down
    remove_attachment :campaigns, :background_image
  end
end
