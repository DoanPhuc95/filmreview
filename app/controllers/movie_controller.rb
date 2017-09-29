class MovieController < ApplicationController
  def show
    @movie = Movie.find_by id: params[:id]
    @rate_point = 4
  end
end
