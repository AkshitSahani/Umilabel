class CreateCampaigns < ActiveRecord::Migration[5.0]
  def change
    create_table :campaigns do |t|
      t.string :title
      t.string :description
      t.integer :owner_id
      t.integer :share_price

      t.timestamps
    end
  end
end
