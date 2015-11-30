class AddMenuToItem < ActiveRecord::Migration
  def change
    add_column :items, :menu_id, :integer
    add_index  :menus, :cuisine, :unique => true
  end
end
