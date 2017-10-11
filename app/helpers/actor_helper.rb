module ActorHelper
    def movies_of_actor actor
        actor.movie.order("name DESC").page(params[:page]).per(24)
    end
    
    def movies_count obj
        obj.movie.count
    end
end
