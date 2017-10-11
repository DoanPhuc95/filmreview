class ActorController < ApplicationController
  before_action :find_actor, only: :show
  
  def index
    @actors = Actor.order(:name).page(params[:page]).per(24)
  end
  
  def show
  end
  
  private
  def find_actor
    @actor = Actor.find_by id: params[:id]
  end
end
