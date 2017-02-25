class RemoveCreateFromFriendships < ActiveRecord::Migration[5.0]
  def change
    remove_column :friendships, :create, :string
  end
end
