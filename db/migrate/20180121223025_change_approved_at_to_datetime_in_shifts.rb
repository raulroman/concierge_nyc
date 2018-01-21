class ChangeApprovedAtToDatetimeInShifts < ActiveRecord::Migration[5.1]
  def change
    remove_column :shifts, :approved_at, :string
    add_column :shifts, :approved_at, :time
  end
end
