class AddColumn2 < ActiveRecord::Migration[6.0]
  def change
    add_column :clinics, :phone_no, :string
    add_column :doctors, :dob, :date
    add_column :patients, :dob, :date
  end
end
