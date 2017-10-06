class MovieController < ApplicationController
  def index
  end
  
  def show
    @movie = Movie.find_by id: params[:id]
    @rate_point = 4
    @comment = Comment.new
  end
end
