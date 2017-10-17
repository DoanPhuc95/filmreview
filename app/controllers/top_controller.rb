class TopController < ApplicationController
  def index
    @title = params_index
    if params_index == "Top Ratings"
      top_rate = Rate.group(:movie).average(:value).map{|key,val| [key,val.to_f]}
          .sort_by{|x| -x.last}
      @movies = Kaminari.paginate_array(top_rate).page(params[:page]).per(24)
    elsif params_index == "Top Reviews"
      @movies = Kaminari.paginate_array(Movie.all.sort{|t| t.comments.count}.reverse)
        .page(params[:page]).per(24)
    elsif params_index == "Top Newest"
      @movies = Movie.order("created_at DESC").page(params[:page]).per(24)
    else
      redirect_to '/404.html'
    end
  end
  
  private
  def params_index
    params[:act]
  end
end
