class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.boolean :is_available
      t.boolean :is_completed
      t.integer :schedule_id
      t.integer :doctor_id
      t.integer :patient_id

      t.timestamps
    end
  end
end
