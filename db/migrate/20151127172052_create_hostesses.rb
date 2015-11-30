class CreateHostesses < ActiveRecord::Migration
  def change
    create_table :hostesses do |t|
      t.string :lastname
      t.references :restaurant
      t.references :hall


      t.timestamps null: false
    end
  end
end
