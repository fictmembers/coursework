class CreateManagers < ActiveRecord::Migration
  def change
    create_table :managers do |t|

      t.string :lastname
      t.string :tel
      t.string :lang
      t.references :restaurant

      t.timestamps null: false
    end
  end
end
