class RateController < ApplicationController
  before_action :find_rate, only: :update
  
  def create
    rate = Rate.new(rate_params)
    if rate.save
      @movie = rate.movie
      respond_to do |format|
        format.js
      end
    else
      flash[:warning]= "You can not rate on this movie, please try again"
    end
  end

  def update
    rate = find_rate
    if rate.update_attributes rate_edit_params
      @movie = rate.movie
      respond_to do |format|
        format.js
      end
    else
      flash[:warning]= "You can not rate on this movie, please try again"
    end
  end
  
  private
  def find_rate
    Rate.find_by id: params[:id]
  end
  
  def rate_params
    params.require(:rate).permit(:value, :user_id, :movie_id)
  end
  
  def rate_edit_params
    params.require(:rate).permit(:value)
  end
end
