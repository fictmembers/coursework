class AddCustomerToUser < ActiveRecord::Migration
  def change
    add_column :users, :customer_id, :integer
  end
end
