class AddIndexToConversations < ActiveRecord::Migration[5.0]
  def change
    drop_table :conversations
  end
end
