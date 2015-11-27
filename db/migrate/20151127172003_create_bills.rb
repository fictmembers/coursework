class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.datetime :CREATED
      t.string :OPTIONS
      t.integer :SUMMARY
      t.references :cashier
      t.references :customer

      t.timestamps null: false
    end
  end
end
