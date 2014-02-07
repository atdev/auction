class RemoveMinBetFromLots < ActiveRecord::Migration
  def change
    remove_column :lots, :min_bet
  end
end
