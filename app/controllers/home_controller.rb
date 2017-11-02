class HomeController < ApplicationController
  def index
    redirect_to movie_managers_url if user_signed_in? and current_user.is_admin?
    @top_rate = Rate.group(:movie).average(:value)
      .map{|key,val| [key,val.to_f]}.sort_by{|x| -x.last}.shift(8)
    @top_newest = Movie.order("created_at DESC").limit(8)
    @random_movie = Movie.order("RANDOM()").limit(10)
  end
end
