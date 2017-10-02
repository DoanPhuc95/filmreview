module MovieHelper
    def get_comments movie
        movie.comment.order("created_at ASC")
    end
    
    def get_avatar comment
        if comment.user.avatar.nil?
            return "https://www.timeshighereducation.com/sites/default/files/byline_photos/default-avatar.png"
        end
        
        comment.user.avatar
    end
    
    def average_rate movie
        return 0 if movie.rate.count == 0
        
        rate_sum = movie.rate.sum(:value).to_f
        
        return (rate_sum/movie.rate.count).to_i if rate_sum%movie.rate.count == 0
        
        number_with_precision rate_sum / movie.rate.count, precision: 1 
    end
    
    def show_option? cmt
        return false unless user_signed_in?
        return cmt.user_id == current_user.id
    end
end
