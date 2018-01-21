class ChangeApprovedAtDataTypeInShifts < ActiveRecord::Migration[5.1]
  def change
    change_column :shifts, :approved_at, :string 
  end
end
