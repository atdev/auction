class CreateLots < ActiveRecord::Migration
  def change
    create_table :lots do |t|
      t.integer :product_id
      t.decimal :min_bet
      t.integer :time_step

      t.timestamps
    end
  end
end
