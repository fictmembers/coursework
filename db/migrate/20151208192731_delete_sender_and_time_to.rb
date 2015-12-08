class DeleteSenderAndTimeTo < ActiveRecord::Migration
  def change
    remove_column :reservations, :to
  end
end
