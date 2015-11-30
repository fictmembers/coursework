class CreateHalls < ActiveRecord::Migration
  def change
    create_table :halls do |t|
      t.string :hall_type
      t.integer :capacity
      t.references :restaurant

      t.timestamps null: false
    end
  end
end
