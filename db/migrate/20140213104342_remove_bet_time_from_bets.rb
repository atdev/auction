class RemoveBetTimeFromBets < ActiveRecord::Migration
  def change
    remove_column :bets, :bet_time
  end
end
