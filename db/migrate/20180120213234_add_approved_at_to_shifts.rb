class AddApprovedAtToShifts < ActiveRecord::Migration[5.1]
  def change
    add_column :shifts, :approved_at, :boolean
  end
end
