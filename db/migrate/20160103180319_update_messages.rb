class UpdateMessages < ActiveRecord::Migration
  def change
    add_column :messages, :from_member,  :integer
    add_column :messages, :to_member,    :integer
    add_column :messages, :theme, :string
    add_column :messages, :text,  :string
    add_column :messages, :viewed, :boolean, default: false
  end
end
