class CreateCashiers < ActiveRecord::Migration
  def change
    create_table :cashiers do |t|
      t.string :lastname
      t.string :lang
      t.references :restaurant
      t.timestamps null: false
    end
  end
end
