class MovieController < ApplicationController
  before_action :find_movie, only: :show
  
  def index
    @movies = Movie.all.page(params[:page]).per(24)
  end
  
  def show
    @rate = find_rate
    if @rate.nil?
      @rate = Rate.new
      @url = rate_index_path
    else
      @url = rate_path(@rate)
    end
    @comment = Comment.new
  end
  
  private
  def find_movie
    @movie = Movie.find_by id: params[:id]
  end
  
  def find_rate
    Rate.find_by user: current_user, movie: @movie
  end
end
