class CreateReliefEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :relief_employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number

      t.timestamps
    end
  end
end
