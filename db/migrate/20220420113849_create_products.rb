class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :shipping_charges_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :shipping_day_id, null: false
      t.timestamps
    end
  end
end
