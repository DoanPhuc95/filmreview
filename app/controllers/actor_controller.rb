class ActorController < ApplicationController
  before_action :find_actor, only: :show
  
  def show
  end
  
  private
  def find_actor
    @actor = Actor.find_by id: params[:id]
  end
end
