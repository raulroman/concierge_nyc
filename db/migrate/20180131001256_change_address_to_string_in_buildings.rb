class ChangeAddressToStringInBuildings < ActiveRecord::Migration[5.1]
  def change
    change_column :buildings, :address, :string
  end
end
