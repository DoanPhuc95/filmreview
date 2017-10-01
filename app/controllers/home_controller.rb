class HomeController < ApplicationController
  def index
    @top_rate = Rate.group(:movie).average(:value)
      .map{|key,val| [key,val.to_f]}.sort_by{|x| -x.last}.shift(8)
    @top_newest = Movie.order("created_at DESC").limit(8)
    @random_movie = Movie.order("RANDOM()").limit(10)
  end
end
