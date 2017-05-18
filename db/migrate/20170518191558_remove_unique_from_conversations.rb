class RemoveUniqueFromConversations < ActiveRecord::Migration[5.0]
  def change
    remove_index :conversations, :author_id

    add_index :conversations, :author_id

    remove_index :conversations, :receiver_id

    add_index :conversations, :receiver_id
  end
end
