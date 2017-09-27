class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.text :description
      t.string :producer
      t.string :image

      t.timestamps null: false
    end
  end
end
