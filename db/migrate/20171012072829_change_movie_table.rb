class ChangeMovieTable < ActiveRecord::Migration
  def change
    add_column :movies, :episode, :integer
    add_column :movies, :year, :integer
  end
end
