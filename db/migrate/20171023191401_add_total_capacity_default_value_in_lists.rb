class AddTotalCapacityDefaultValueInLists < ActiveRecord::Migration[5.0]
  def change
    change_column_default :lists, :total_capacity, to: 10
  end
end
