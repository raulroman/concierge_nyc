class CreateShifts < ActiveRecord::Migration[5.1]
  def change
    create_table :shifts do |t|
      t.integer :full_time_employee_id
      t.string :day_of_the_week
      t.string :date
      t.string :start_time
      t.string :end_time
      t.string :position
      t.integer :building_id
      t.boolean :approved_denied
      t.boolean :private_listing
      t.boolean :public_listing
      t.integer :claimed_by_employee_id
      t.string :relief_type

      t.timestamps
    end
  end
end
