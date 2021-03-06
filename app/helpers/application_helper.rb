module ApplicationHelper
    def is_admin?
        if user_signed_in? 
            return true if current_user.admin == true
            return false
        end
        return false
    end
    
    def is_movie_manager
        url = request.original_url
        return true if url.include? "movie_managers"
        return true if url.include? "movies" and !url.include? "new"
        
        return false
    end
    
    def is_movie_new
        url = request.original_url
        return true if url.include? "movies/new"
        
        return false
    end
    
    def is_user_manager
        url = request.original_url
        return true if url.include? "users/index"
        return true if url.include? "profiles/"
        
        return false
    end
    
    def is_user_edit
        url = request.original_url
        return true if url.include? "/profile" and url.length == 48
        
        return false
    end
    
    def is_change_password
        url = request.original_url
        return true if url.include? "users/edit"
        
        return false
    end
    
    def cut_off name
        if name.length > 20
            name_ = name[0..17] + "..."
            return name_
        end
        
        return name
    end
    
    def cut_off_2 name
        if name.length > 15
            name_ = name[0..12] + "..."
            return name_
        end
        
        return name
    end
end
