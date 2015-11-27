class CreateChefs < ActiveRecord::Migration
  def change
    create_table :chefs do |t|
      t.string :LASTNAME
      t.references :restaurant
      t.timestamps null: false
    end
  end
end
