class MovieManagersController < ApplicationController
  before_action :check_admin, only: :index
  def index
    @movies = Movie.order(:name).page(params[:page]).per(24)
  end
  
  private
  def check_admin
    redirect_to root_path unless user_signed_in? and current_user.is_admin?
  end
end
