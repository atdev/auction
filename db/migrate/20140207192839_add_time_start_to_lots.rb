class AddTimeStartToLots < ActiveRecord::Migration
  def change
    add_column :lots, :time_start, :integer
  end
end
