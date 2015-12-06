class DeleteCapacityFromHall < ActiveRecord::Migration
  def change
    remove_column :halls, :capacity
  end
end
