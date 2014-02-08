class AddBetsCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :bets_count, :integer
  end
end
