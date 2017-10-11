class SearchController < ApplicationController
  before_action :search_result, only: :index
  
  def index
    @title = params_name
    if @title.blank?
      redirect_to movie_index_path
    else
      @result = Kaminari.paginate_array(search_result).page(params[:page]).per(24)
    end
  end
  
  private
  def params_name
    params[:query]
  end
  
  def search_result
    result = search_movie
    result += search_actor
    @count = result.count
    return result
  end

  def search_movie
    Movie.where("name LIKE?", "%#{params_name}%").to_a
  end
  
  def search_actor
    Actor.where("name LIKE?", "%#{params_name}%").to_a
  end
end
