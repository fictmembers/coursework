class DelleteFromBill < ActiveRecord::Migration
  def change
    remove_column :bills, :options
    remove_column :bills, :created
  end
end
