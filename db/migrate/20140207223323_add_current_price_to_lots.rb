class AddCurrentPriceToLots < ActiveRecord::Migration
  def change
    add_column :lots, :current_price, :decimal
  end
end
