class AddListIdToShops < ActiveRecord::Migration[5.0]
  def change
    add_column :shops, :list_id, :integer
  end
end
