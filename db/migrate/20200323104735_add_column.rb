class AddColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :schedules, :is_available, :boolean
    add_column :schedules, :is_completed, :boolean
  end
end
