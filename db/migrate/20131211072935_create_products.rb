class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :category_id
      t.string :name
      t.integer :shop_price
      t.string :image
      t.text :description

      t.timestamps
    end
  end
end
