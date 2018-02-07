class RenameColumnInShiftsTable < ActiveRecord::Migration[5.1]
  def change
    rename_column :shifts, :full_time_employee_id, :employee_id
  end
end
