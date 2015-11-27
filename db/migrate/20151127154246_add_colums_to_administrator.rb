class AddColumsToAdministrator < ActiveRecord::Migration
  def change
    add_column :administrators, :lastname, :string
    add_column :administrators, :tel,      :string
    add_column :administrators, :jobplace, :integer
  end
end
