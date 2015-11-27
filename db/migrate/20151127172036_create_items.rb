class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :PRICE
      t.string :DESCRIPTION
      t.timestamps null: false
    end
  end
end
