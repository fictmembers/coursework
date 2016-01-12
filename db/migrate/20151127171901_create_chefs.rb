class CreateChefs < ActiveRecord::Migration
  def change
    create_table :chefs do |t|
      t.string :lastname
      t.string :lang
      t.references :restaurant
      t.timestamps null: false
    end
  end
end
