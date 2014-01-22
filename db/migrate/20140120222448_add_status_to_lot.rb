class AddStatusToLot < ActiveRecord::Migration
  def change
    add_column :lots, :status, :string
  end
end
