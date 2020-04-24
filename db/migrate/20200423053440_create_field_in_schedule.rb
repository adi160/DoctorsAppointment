class CreateFieldInSchedule < ActiveRecord::Migration[6.0]
  def change
    add_column :schedules, :patient_id, :integer
  end
end
