class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :value
      t.references :movie, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
