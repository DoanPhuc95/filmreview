module ActorHelper
    def movies_of_actor actor
        actor.movies.order("name DESC").page(params[:page]).per(24)
    end
    
    def movies_count obj
        obj.movies.count
    end
end
