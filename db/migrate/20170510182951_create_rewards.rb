class CreateRewards < ActiveRecord::Migration[5.0]
  def change
    create_table :rewards do |t|
      t.integer :campaign_id
      t.string :client
      t.integer :percentage
      t.boolean :confirmed, default: false

      t.timestamps
    end
  end
end
