module MovieHelper
    def get_comments movie
        movie.comments.order("created_at ASC")
    end
    
    def get_producer movie
        movie.producer.name
    end
    
    def average_rate movie
        return 0 if movie.rates.count == 0
        
        rate_sum = movie.rates.sum(:value).to_f
        
        return (rate_sum/movie.rates.count).to_i if rate_sum%movie.rates.count == 0
        
        number_with_precision rate_sum / movie.rates.count, precision: 1 
    end
    
    def show_option? cmt
        return false unless user_signed_in?
        return cmt.user_id == current_user.id
    end
    
    def get_categories movie
        movie.categories
    end
    
    def get_category value
        case value
            when 0
                return "Action"
            when 1
                return "Comedy"
            when 2
                return "Historical Drama"
            when 3
                return "Drama"
            when 4
                return "Fantasy"
            when 5
                return "Kungfu"
            when 6
                return "Mystery"
            when 7
                return "War"
            when 8
                return "Thriller - Horror"
            when 9
                return "Psychological"
            when 10
                return "Family"
            when 11
                return "Crime"
            when 12
                return "Animation"
            when 13
                return "Documentary"
            when 14
                return "Adventure"
            when 15
                return "18 +"
            when 16
                return "Romance"
            when 17
                return "Mystery"
            when 18
                return "Sport - Musical"
            else
                return ""
        end
    end
    
    def get_actors movie
        movie.actors
    end
    
    def get_actors_text movie
        actors = movie.actors
        text = ""
        actors.each.with_index do |t, i|
            if i == 0
                text += t.name
            else
                text += ", #{t.name}"
            end
        end
        return text
    end
    
    def category_is_checked? category, value
        return category.find_by(value: value)
    end
    
    def get_movie_image movie
        return "http://www.3ciemme.it/images/joomlart/demo/default.jpg" if movie.image.nil?
        return movie.image
    end
end
