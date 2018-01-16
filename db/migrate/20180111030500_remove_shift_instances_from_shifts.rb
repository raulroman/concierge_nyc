class RemoveShiftInstancesFromShifts < ActiveRecord::Migration[5.1]
  def change
    remove_column :shifts, :shift1, :string
    remove_column :shifts, :shift2, :string
    remove_column :shifts, :shift3, :string
    remove_column :shifts, :shift4, :string
    remove_column :shifts, :shift5, :string
  end

end
