class CreateWaiters < ActiveRecord::Migration
  def change
    create_table :waiters do |t|
      t.string :LASTNAME
      t.references :restaurant

      t.timestamps null: false
    end
  end
end
