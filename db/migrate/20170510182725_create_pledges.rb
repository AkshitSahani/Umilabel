class CreatePledges < ActiveRecord::Migration[5.0]
  def change
    create_table :pledges do |t|
      t.integer :user_id
      t.integer :reward_id
      t.integer :campaign_id

      t.timestamps
    end
  end
end
