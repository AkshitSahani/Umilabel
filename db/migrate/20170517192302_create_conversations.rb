class CreateConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :conversations do |t|
      t.integer :author_id
      t.integer :receiver_id

      t.timestamps
    end
    add_index :conversations, :author_id, unique: true
    add_index :conversations, :receiver_id, unique: true
  end
end
