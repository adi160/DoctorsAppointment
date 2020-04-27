class AddColumnToDoctorAndClinic < ActiveRecord::Migration[6.0]
  def change
    add_column :clinics, :state, :string
    remove_column :doctors, :middle_name, :string
  end
end
