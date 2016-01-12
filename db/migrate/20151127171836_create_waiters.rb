class CreateWaiters < ActiveRecord::Migration
  def change
    create_table :waiters do |t|
      t.string :lastname
      t.references :restaurant
      t.string :lang

      t.timestamps null: false
    end
  end
end
