class AddNumSharesPledgedToPledges < ActiveRecord::Migration[5.0]
  def change
    add_column :pledges, :num_shares_pledged, :decimal
  end
end
