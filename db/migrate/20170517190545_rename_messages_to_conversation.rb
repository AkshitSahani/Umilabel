class RenameMessagesToConversation < ActiveRecord::Migration[5.0]
  def self.up
    rename_table  :messages, :conversations
  end

  def self.down
    rename_table :conversations, :messages
  end
end
