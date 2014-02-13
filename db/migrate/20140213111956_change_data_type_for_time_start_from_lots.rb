class ChangeDataTypeForTimeStartFromLots < ActiveRecord::Migration
  def change
    change_column :lots, :time_start, :datetime
  end
end
