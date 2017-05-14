class AddAttachmentDocument1ToCampaigns < ActiveRecord::Migration
  def self.up
    change_table :campaigns do |t|
      t.attachment :document_1
    end
  end

  def self.down
    remove_attachment :campaigns, :document_1
  end
end
