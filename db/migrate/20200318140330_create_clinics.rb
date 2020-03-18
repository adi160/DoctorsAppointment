class CreateClinics < ActiveRecord::Migration[6.0]
  def change
    create_table :clinics do |t|
      t.string :clinic_address
      t.datetime :start
      t.datetime :end
      t.integer :doctor_id

      t.timestamps
    end
  end
end
