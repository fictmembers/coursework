class DeleteTelFromManager < ActiveRecord::Migration
  def change
    remove_column :managers, :tel
  end
end
