class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :NAME
      t.string :ADRESS
      t.string :TEL
      t.timestamps null: false
    end
  end
end
