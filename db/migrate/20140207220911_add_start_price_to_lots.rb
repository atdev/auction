class AddStartPriceToLots < ActiveRecord::Migration
  def change
    add_column :lots, :start_price, :decimal
  end
end
