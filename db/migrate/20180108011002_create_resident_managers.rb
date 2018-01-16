class CreateResidentManagers < ActiveRecord::Migration[5.1]
  def change
    create_table :resident_managers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.string :building

      t.timestamps
    end
  end
end
