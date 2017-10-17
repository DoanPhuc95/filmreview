class MovieController < ApplicationController
  before_action :find_movie, only: :show
  before_action :check_admin, only: :new
  before_action :create_producer, only: :create
  
  def index
    @movies = Movie.all.page(params[:page]).per(24)
  end
  
  def new
    @movie = Movie.new
    # 19.times {@movie.categories.build}
  end
  
  def create
    @movie = new_movie
    if @movie.save
      update_categories
      update_actor_movie
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
  
  def update_actor_movie
    unless params[:actor].empty?
      actors = split_actor
      actors.each do |t|
        if Actor.find_by(name: t.strip()).nil?
          actor = Actor.new name: t.strip()
          if actor.save
            ActorMovie.create! actor: actor, movie: @movie
          end
        else
          actor = Actor.find_by name: t.strip()
          ActorMovie.create! actor: actor, movie: @movie
        end
      end
    end
  end
  
  def split_actor
    return params[:actor].split /,|;/ unless params[:actor].empty?
  end
  
  def new_movie
    name = params[:movie][:name]
    year = params[:movie][:year]
    episode = params[:movie][:episode]
    description = params[:movie][:description]
    image = params[:movie][:image]
    return Movie.new name:name, year: year, episode: episode, producer: @producer, description: description, image: image
  end
  
  def update_categories
    params[:category].each do |key, val|
      Category.create! value: key, movie: @movie
    end
  end
end
