class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :cuisine
      t.timestamps null: false
    end
  end
end
