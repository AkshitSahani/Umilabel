class AddPercentagePledgedtoPledges < ActiveRecord::Migration[5.0]
  def change
    add_column :pledges, :percentage_pledged, :integer
  end
end
