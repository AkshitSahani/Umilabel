class AddAttachmentAlbumCoverToCampaigns < ActiveRecord::Migration
  def self.up
    change_table :campaigns do |t|
      t.attachment :album_cover
    end
  end

  def self.down
    remove_attachment :campaigns, :album_cover
  end
end
