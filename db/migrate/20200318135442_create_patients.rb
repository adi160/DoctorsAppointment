class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :phone_no
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.integer :pincode
      t.integer :user_id

      t.timestamps
    end
  end
end
