class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.datetime :created
      t.string :options
      t.integer :summary
      t.references :cashier
      t.references :customer

      t.timestamps null: false
    end
  end
end
