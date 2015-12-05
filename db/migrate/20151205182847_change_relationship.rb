class ChangeRelationship < ActiveRecord::Migration
  def change
    remove_column :orders, :bill_id
    add_column :bills, :order_id, :integer
  end
end
