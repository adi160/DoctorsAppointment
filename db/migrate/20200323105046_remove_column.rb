class RemoveColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :is_available
    remove_column :bookings, :is_completed
  end
end
