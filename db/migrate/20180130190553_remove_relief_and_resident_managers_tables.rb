class RemoveReliefAndResidentManagersTables < ActiveRecord::Migration[5.1]
  def change
    rename_column :buildings, :resident_manager, :address
    add_column :users, :building_id, :integer
  end
end
