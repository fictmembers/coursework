class DeleteSummaryFromBills < ActiveRecord::Migration
  def change
    remove_column :bills, :summary
  end
end
