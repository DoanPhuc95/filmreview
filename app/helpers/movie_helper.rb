module MovieHelper
    def get_comments movie
        movie.comment.order("created_at ASC")
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
    
    def get_categories movie
        movie.category
    end
    
    def get_category value
        case value
            when 0
                return "Phim hành động"
            when 1
                return "Phim hài hước"
            when 2
                return "Phim cổ trang"
            when 3
                return "Drama"
            when 4
                return "Phim viễn tưởng"
            when 5
                return "Phim võ thuật"
            when 6
                return "Phim thần thoại"
            when 7
                return "Phim thể thao- âm nhạc"
            when 8
                return "Phim chiến tranh"
            when 9
                return "Phim kinh dị"
            when 10
                return "Phim tâm lý"
            when 11
                return "Phim gia đình"
            when 12
                return "Phim hình sự"
            when 13
                return "Phim hồi hộp, gay cấn"
            when 14
                return "Phim hoạt hình"
            when 15
                return "Phim tài liệu"
            when 16
                return "Phim phiêu lưu"
            when 17
                return "Phim tình cảm, lãng mạn"
            when 18
                return "Phim bí ẩn, siêu nhiên"
            else
                return ""
        end
    end
    
    def get_actors movie
        movie.actor
    end
end
