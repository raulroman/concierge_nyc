class RemovePrivateAndPublicFromShifts < ActiveRecord::Migration[5.1]
  def change
    remove_column :shifts, :private_listing, :boolean
    remove_column :shifts, :public_listing, :boolean
  end
end
