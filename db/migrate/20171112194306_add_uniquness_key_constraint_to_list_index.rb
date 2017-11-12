class AddUniqunessKeyConstraintToListIndex < ActiveRecord::Migration[5.0]
  def change
    remove_index :lists, :shop_id
    add_index :lists, :shop_id, unique: true
  end
end
