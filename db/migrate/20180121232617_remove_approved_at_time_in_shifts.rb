class RemoveApprovedAtTimeInShifts < ActiveRecord::Migration[5.1]
  def change
    remove_column :shifts, :approved_at, :time
    add_column :shifts, :approved_at, :datetime
  end
end
