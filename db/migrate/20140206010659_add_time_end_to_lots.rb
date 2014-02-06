class AddTimeEndToLots < ActiveRecord::Migration
  def change
    add_column :lots, :time_end, :integer
    add_column :lots, :bet_step, :decimal
  end
end
