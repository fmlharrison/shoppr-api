class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :brand
      t.decimal :max_price, precision: 10, scale: 2
      t.integer :quantity
      t.text :comment
      t.references :list, foreign_key: true

      t.timestamps
    end
  end
end
