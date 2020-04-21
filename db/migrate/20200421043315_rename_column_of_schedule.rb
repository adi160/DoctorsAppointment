class RenameColumnOfSchedule < ActiveRecord::Migration[6.0]
  def change
    rename_column :schedules, :start_time, :start
    rename_column :schedules, :end_time, :end
    
  end
end
