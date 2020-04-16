class RemoveColumnFromPatient < ActiveRecord::Migration[6.0]
  def change
    remove_column :patients, :middle_name, :string
    remove_column :patients, :country, :string
    remove_column :patients, :dob, :date
    add_column :patients, :age, :integer
    add_column :patients, :sex, :string
  end
end
