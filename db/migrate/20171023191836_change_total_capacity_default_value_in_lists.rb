class ChangeTotalCapacityDefaultValueInLists < ActiveRecord::Migration[5.0]
  def change
    change_column :lists, :total_capacity, :integer, :default => 10
  end
end
