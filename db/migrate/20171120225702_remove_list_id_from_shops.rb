class RemoveListIdFromShops < ActiveRecord::Migration[5.0]
  def change
    remove_column :shops, :list_id, :integer
  end
end
