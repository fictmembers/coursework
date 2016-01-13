class LanguageToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :lang, :string
  end
end
