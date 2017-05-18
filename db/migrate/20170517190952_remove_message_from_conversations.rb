class RemoveMessageFromConversations < ActiveRecord::Migration[5.0]
  def change
    remove_column :conversations, :message, :text
  end
end
