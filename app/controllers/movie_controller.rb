class MovieController < ApplicationController
  def index
    @movies = Movie.all.page(params[:page]).per(24)
  end
  
  def show
    @movie = Movie.find_by id: params[:id]
    @rate_point = 4
    @comment = Comment.new
  end
end
