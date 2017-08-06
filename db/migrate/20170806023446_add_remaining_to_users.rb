class AddRemainingToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :description, :string
    add_column :users, :studio_name, :string
    add_column :users, :tags, :string
    add_column :users, :founded_in, :string
    add_column :users, :full_name, :string 
  end
end
