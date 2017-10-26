class ChangeNameOfTypeColumnInShopsTable < ActiveRecord::Migration[5.0]
  def change
    rename_column :shops, :type, :shop_kind
  end
end
