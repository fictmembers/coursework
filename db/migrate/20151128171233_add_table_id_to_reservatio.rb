class AddTableIdToReservatio < ActiveRecord::Migration
  def change
    add_column :reservations, :table_id, :integer
    add_column :reservations, :customer_id, :integer
  end
end
