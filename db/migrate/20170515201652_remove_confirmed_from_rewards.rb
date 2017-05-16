class RemoveConfirmedFromRewards < ActiveRecord::Migration[5.0]
  def change
    remove_column :rewards, :confirmed, :boolean, default: false
    add_column :pledges, :confirmed, :boolean, default: false
  end
end
