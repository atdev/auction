class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.integer :lot_id
      t.integer :user_id
      t.decimal :bet_amount
      t.integer :bet_time
      t.timestamps
    end
  end
end
