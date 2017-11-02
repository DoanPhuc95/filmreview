class MovieController < ApplicationController
  before_action :find_movie, only: [:show, :destroy, :edit, :update] #except: [:index, :create, :new]
  before_action :check_admin, only: :new
  before_action :create_producer, only: :create
  
  def index
    @movies = Movie.all.page(params[:page]).per(24)
  end
  
  def new
    @movie = Movie.new
  end
  
  def create
    @movie = new_movie
    if @movie.save
      create_categories
      create_actor_movie
      redirect_to @movie
    else
      redirect_to :back
    end
  end
  
  def show
    @rate = find_rate
    if @rate.nil?
      @rate = Rate.new
      @url = rate_index_path
    else
      @url = rate_path(@rate)
    end
    @comment = Comment.new
  end
  
  def edit
    redirect_to movies_path unless user_signed_in? and current_user.is_admin?
    @category = @movie.categories
  end
  
  def update
    if @movie.update_attributes update_movie_params
      update_producer
      update_actor_movie
      update_categories
      redirect_to @movie
    end
  end
  
  def destroy
    redirect_to movies_path if @movie.destroy
  end
  
  private
  def check_admin
    redirect_to movie_index_path unless is_admin?
  end
  
  def find_movie
    @movie = Movie.find_by id: params[:id]
  end
  
  def find_rate
    Rate.find_by user: current_user, movie: @movie
  end
  
  def create_producer
    name = params[:movie][:producer].strip()
    producer = Producer.find_by(name: name)
    if producer.nil?
      @producer = Producer.new(name: name)
      redirect_to :back unless @producer.save
    else
      @producer = producer
    end
  end
  
  def create_actor_movie
    unless params[:actor].empty?
      actors = split_actor
      actors.each do |t|
        if Actor.find_by(name: t).nil?
          actor = Actor.new name: t
          if actor.save
            ActorMovie.create! actor: actor, movie: @movie
          end
        else
          actor = Actor.find_by name: t
          ActorMovie.create! actor: actor, movie: @movie
        end
      end
    end
  end
  
  def split_actor
    return params[:actor].split(/,|;/).map{|x| x.strip()} unless params[:actor].empty?
  end
  
  def new_movie
    name = params[:movie][:name]
    year = params[:movie][:year]
    episode = params[:movie][:episode]
    description = params[:movie][:description]
    image = params[:movie][:image]
    return Movie.new name:name, year: year, episode: episode, producer: @producer, description: description, image: image
  end
  
  def create_categories
    params[:category].each do |key, val|
      Category.create! value: key, movie: @movie
    end
  end
  
  def update_movie_params
    params.require(:movie).permit(:name, :year, :content, :episode, :image, :description)
  end
  
  def update_producer
    producer_name = params[:producer].strip()
    unless Producer.find_by name: producer_name
      producer = Producer.new name: producer_name
      if producer.save
        @movie.update! producer: producer
      end
    end
  end
  
  def update_actor_movie
    actors = split_actor
    current_actors = @movie.actors
    current_actors.each do |t|
      ActorMovie.find_by(actor: t, movie: @movie).destroy unless actors.include? t.name
    end
    actors.each do |actor_name|
      unless current_actors.find_by name: actor_name
        new_actor = Actor.new name: actor_name
        if new_actor.save
          ActorMovie.create! actor: new_actor, movie: @movie
        end
      end
    end
  end
  
  def update_categories
    current_categories = @movie.categories
    current_categories.each do |t|
      t.destroy if params[:category][t.value.to_s].nil?
    end
    params[:category].each do |key, val|
      unless val == "on"
        Category.create! value: key.to_i, movie: @movie
      end
    end
  end
end
