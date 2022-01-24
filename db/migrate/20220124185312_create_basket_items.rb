class CreateBasketItems < ActiveRecord::Migration[5.2]
  def change
    create_table :basket_items do |t|
      t.references :item, foreign_key: true
      t.references :basket, foreign_key: true
      t.integer :quantity
      t.integer :price
      t.integer :final_price

      t.timestamps
    end
  end
end
