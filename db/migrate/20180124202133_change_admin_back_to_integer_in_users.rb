class ChangeAdminBackToIntegerInUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :admin, :boolean
    add_column :users, :admin, :integer
  end
end
