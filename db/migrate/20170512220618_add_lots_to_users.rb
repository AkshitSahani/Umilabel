class AddLotsToUsers < ActiveRecord::Migration[5.0]
  def change

    add_column :users, :studio_name, :string
    add_column :users, :description, :string
    add_column :users, :tags, :string
    add_column :users, :founded_in, :string

    def up
      add_attachment :users, :avatar
      add_attachment :users, :background_image
    end

    def down
      remove_attachment :users, :avatar
      remove_attachment :users, :background_image
    end

  end
end
