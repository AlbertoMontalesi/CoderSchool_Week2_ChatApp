class DropFriendhips < ActiveRecord::Migration[5.0]
  def change
    drop_table :friendhips
  end
end