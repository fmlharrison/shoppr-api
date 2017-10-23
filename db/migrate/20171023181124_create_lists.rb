class CreateLists < ActiveRecord::Migration[5.0]
  def change
    create_table :lists do |t|
      t.integer :total_capacity
      t.references :shop, foreign_key: true

      t.timestamps
    end
  end
end
