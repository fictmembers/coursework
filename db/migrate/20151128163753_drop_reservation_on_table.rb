class DropReservationOnTable < ActiveRecord::Migration
  def change
    remove_column :tables, :reservation_id
  end
end
