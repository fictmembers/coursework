class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.datetime :reserv_time     

      t.timestamps null: false
    end
  end
end
