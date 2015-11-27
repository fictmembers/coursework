class AddColumnsToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :name,    :string
    add_column :restaurants, :tel,     :string
    add_column :restaurants, :address, :string
  end
end
