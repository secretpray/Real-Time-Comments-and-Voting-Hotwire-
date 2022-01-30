class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, null: false, limit: 150
      t.string :sku, limit: 12
      t.string :brand
      t.string :product_type
      t.float :popularity, default: 0
      t.decimal :price, precision: 10, scale: 2
      t.integer :discount, default: 0
      t.integer :color
      t.integer :size
      t.integer :sex
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
    add_index :products, :name
    add_index :products, :sku, unique: true
  end
end
