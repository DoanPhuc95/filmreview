module ActorHelper
    def movies_of_actor actor
        actor.movie.page(params[:page]).per(24)
    end
end
