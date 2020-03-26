class AddColumnToDoctor < ActiveRecord::Migration[6.0]
  def change
    add_column :doctors, :category_id, :integer
  end
end
