class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :category_name
      t.integer :doctor_id

      t.timestamps
    end
  end
end
