class AddColumnToClinics < ActiveRecord::Migration[6.0]
  def change
    add_column :clinics, :city, :string
  end
end
