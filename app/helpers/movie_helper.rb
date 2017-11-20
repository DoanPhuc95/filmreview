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
                return t "categories.action"
            when 1
                return t "categories.comedy"
            when 2
                return t "categories.historical"
            when 3
                return t "categories.drama"
            when 4
                return t "categories.fantasy"
            when 5
                return t "categories.kungfu"
            when 6
                return t "categories.mystery"
            when 7
                return t "categories.war"
            when 8
                return t "categories.horror"
            when 9
                return t "categories.psychological"
            when 10
                return t "categories.family"
            when 11
                return t "categories.crime"
            when 12
                return t "categories.anime"
            when 13
                return t "categories.documentary"
            when 14
                return t "categories.adventure"
            when 15
                return t "categories.adult"
            when 16
                return t "categories.romance"
            when 17
                return t "categories.oscar"
            when 18
                return t "categories.sport_musical"
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
