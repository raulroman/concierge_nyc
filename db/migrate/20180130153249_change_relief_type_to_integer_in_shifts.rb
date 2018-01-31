class ChangeReliefTypeToIntegerInShifts < ActiveRecord::Migration[5.1]
  def change
    remove_column :shifts, :relief_type, :string
    add_column :shifts, :relief_type, :integer
  end
end
