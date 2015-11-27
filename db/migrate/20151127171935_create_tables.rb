class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.integer :VISNUMBER
      t.boolean :STATUS, default: true
      t.references :restaurant
      t.references :reservation
      t.references :waiter
      t.timestamps null: false
    end
  end
end
