class RemoveConfirmedFromPledges < ActiveRecord::Migration[5.0]
  def change
    remove_column :pledges, :confirmed, :boolean, default: false
  end
end
