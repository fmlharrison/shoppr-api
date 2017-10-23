class CreateShops < ActiveRecord::Migration[5.0]
  def change
    create_table :shops do |t|
      t.string :location
      t.datetime :date
      t.string :type
      t.string :shopper
      t.decimal :total_price, precision: 10, scale: 2
      t.boolean :is_complete

      t.timestamps
    end
  end
end
