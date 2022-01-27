class FixPriceType < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :price, :float
    change_column :baskets, :price, :float
    change_column :baskets, :final_price, :float
    change_column :basket_items, :price, :float
    change_column :basket_items, :final_price, :float
  end
end
