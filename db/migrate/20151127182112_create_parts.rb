class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.belongs_to :order, index: true
      t.belongs_to :item, index: true
      t.timestamps null: false
    end
  end
end
