class CreateHalls < ActiveRecord::Migration
  def change
    create_table :halls do |t|
      t.string :HALL_TYPE
      t.integer :CAPACITY
      t.references :restaurant

      t.timestamps null: false
    end
  end
end
