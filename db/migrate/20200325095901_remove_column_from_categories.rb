class RemoveColumnFromCategories < ActiveRecord::Migration[6.0]
  def change
    remove_column :categories, :doctor_id, :integer
  end
end
