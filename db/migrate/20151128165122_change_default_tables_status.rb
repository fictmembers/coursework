class ChangeDefaultTablesStatus < ActiveRecord::Migration
  def change
    change_column :tables, :STATUS, :boolean, :default => false
  end
end
