class AddShiftInstancesToShfits < ActiveRecord::Migration[5.1]
  def change
    add_column :shifts, :shift1, :string
    add_column :shifts, :shift2, :string
    add_column :shifts, :shift3, :string
    add_column :shifts, :shift4, :string
    add_column :shifts, :shift5, :string
  end
end
