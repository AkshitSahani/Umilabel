class CreateSubscriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :subscriptions do |t|
      t.integer :subscribed_to_id
      t.integer :subscribee_id

      t.timestamps
    end
  end
end
