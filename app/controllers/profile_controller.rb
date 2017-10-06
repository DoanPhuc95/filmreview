class ProfileController < ApplicationController
  before_action :find_user, only: [:index, :update]
  
  def index
  end
  
  def update
    redirect_to :back if @user.update_attributes! user_edit_params
  end
  
  private
  
  def user_edit_params
    params.require(:user).permit(:name, :email, :gender, :avatar)
  end
  
  def find_user
    @user = current_user
  end
end
