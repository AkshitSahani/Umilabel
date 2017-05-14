class AddAttachmentDocument2ToCampaigns < ActiveRecord::Migration
  def self.up
    change_table :campaigns do |t|
      t.attachment :document_2
    end
  end

  def self.down
    remove_attachment :campaigns, :document_2
  end
end
