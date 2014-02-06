class ChangeDateFormatInLots < ActiveRecord::Migration
  def change
    change_column :lots, :time_end, :datetime
  end
end
