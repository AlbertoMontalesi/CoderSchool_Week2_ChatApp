class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email, index :true #to make it easier to retrieve users
      t.string :password_digest

      t.timestamps
    end
  end
end
