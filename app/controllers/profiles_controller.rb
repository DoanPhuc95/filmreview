class ProfilesController < ApplicationController
  before_action :find_user, only: [:show, :update, :destroy]

  def show
  end

  def update
    redirect_to :back if @user.update_attributes! user_edit_params
  end

  def destroy
    @param_id = @user.id
    if @user.destroy
      respond_to do |format|
        format.js
      end
    end
  end
  
  private
  def user_edit_params
    params.require(:user).permit(:name, :email, :gender, :avatar)
  end
  
  def find_user
    @user = User.find_by id: params[:id]
    redirect_to profile_index_path if @user.is_admin?
  end
end
