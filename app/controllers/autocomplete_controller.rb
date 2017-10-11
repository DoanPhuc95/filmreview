class AutocompleteController < ApplicationController
  def index
    movie_json = Movie.all.select :id, :name
    actor_json = Actor.all.select :id, :name
    # producer_json = Actor.all.select :id, :name
    @search = {:movie => movie_json, :actor => actor_json}
    render json: @search
  end
end
