class YearController < ApplicationController
  before_action :get_params, only: :index
  def index
    movie = Movie.where year: @year
    redirect_to '/404.html' if movie.count == 0
    
    @movies = movie.page(params[:page]).per(24)
  end
  
  private
  def get_params
    @year = params[:year]
  end
end
