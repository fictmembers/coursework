class AddUniqueIndexToAdminName < ActiveRecord::Migration
  def change
    add_column :administrators, :login, :string
    add_index  :administrators, :login, unique: true
    add_column :administrators, :password_digest, :string
  end
end
