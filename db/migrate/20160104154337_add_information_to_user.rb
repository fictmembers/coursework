class AddInformationToUser < ActiveRecord::Migration
  def change
    add_column :users, :lastname, :string
    add_column :users, :email, :string
    add_column :users, :password_digest, :string
    add_column :users, :remember_token, :string
    add_column :users, :photo, :string

    add_index :users, :email, unique: true
    add_index :users, :remember_token
  end
end
