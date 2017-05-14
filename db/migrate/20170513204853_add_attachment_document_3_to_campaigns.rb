class AddAttachmentDocument3ToCampaigns < ActiveRecord::Migration
  def self.up
    change_table :campaigns do |t|
      t.attachment :document_3
    end
  end

  def self.down
    remove_attachment :campaigns, :document_3
  end
end
