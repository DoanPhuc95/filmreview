class AdminSearchesController < ApplicationController
  before_action :param_act, only: :index
  
  def index
    if @action == "movie"
      @movies = Kaminari.paginate_array(search_movie).page(params[:page]).per(24)
    else
      @movies = search_user
    end
    respond_to do |format|
      format.js
    end
  end
  
  private
  def param_act
    @action = params[:act]
  end
  
  def params_movie
    params[:movie_name]
  end
  
  def params_category
    params[:category].to_i
  end
  
  def search_movie
    if params_movie.blank?
      return [] if params_category == -1
      
      return Category.where(value: params_category).map{ |t| t.movie }
    else
      if params_category == -1
        return Movie.where("name LIKE?", "%#{params_movie}%").to_a
      else
        return Category.where(value: params_category).map{ |t| t.movie }.select{ |t| t.name.include? params_movie }
      end
    end
  end
  
  def search_user
    return User.where("name LIKE?", "%#{params_movie}%").page(params[:page]).per(24) if params_category == 1
    
    return User.where("email LIKE?", "%#{params_movie}%").page(params[:page]).per(24)
  end
end
