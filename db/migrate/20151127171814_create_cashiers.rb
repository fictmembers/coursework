class CreateCashiers < ActiveRecord::Migration
  def change
    create_table :cashiers do |t|
      t.string :lastname
      t.references :restaurant
      t.timestamps null: false
    end
  end
end
