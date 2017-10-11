class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.text :description
      t.references :producer, index: true, foreign_key: true
      t.string :image

      t.timestamps null: false
    end
  end
end
