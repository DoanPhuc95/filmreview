class UsersController < ApplicationController
  def index
    @users = User.order(:name).page(params[:page]).per(24)
  end
end
