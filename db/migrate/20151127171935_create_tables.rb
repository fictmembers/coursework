class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.integer :visnumber
      t.boolean :status, default: true
      t.references :restaurant
      t.references :reservation
      t.references :hall
      t.references :waiter
      t.timestamps null: false
    end
  end
end
