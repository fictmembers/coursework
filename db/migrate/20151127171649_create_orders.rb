class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :restaurant
      t.references :bill
      t.references :customer
      t.references :waiter
      t.references :manager
      t.references :chef
      t.string :lang, default: 'en'
      t.timestamps null: false
    end
  end
end
