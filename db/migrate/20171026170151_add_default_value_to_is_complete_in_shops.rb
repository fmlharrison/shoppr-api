class AddDefaultValueToIsCompleteInShops < ActiveRecord::Migration[5.0]
  def change
    change_column :shops, :is_complete, :boolean, :default => false
  end
end
