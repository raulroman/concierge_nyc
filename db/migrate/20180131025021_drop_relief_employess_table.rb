class DropReliefEmployessTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :relief_employees
  end
end
