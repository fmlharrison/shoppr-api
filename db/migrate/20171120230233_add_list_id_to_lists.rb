class AddListIdToLists < ActiveRecord::Migration[5.0]
  def change
    add_column :lists, :list_id, :integer
  end
end
