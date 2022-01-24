class CreateBaskets < ActiveRecord::Migration[5.2]
  def change
    create_table :baskets do |t|
      t.integer :price
      t.integer :final_price

      t.timestamps
    end
  end
end
