class AddUniqueDatetimEtoReservations < ActiveRecord::Migration
  def change
    add_index :reservations, [:table_id, :reserv_time, :from], unique: true
  end
end
