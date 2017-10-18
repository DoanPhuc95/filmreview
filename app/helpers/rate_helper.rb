module RateHelper
    def rate_id rate
        if rate.nil? || rate.value == 0 || rate.value.blank?
            return 0
        end
        
        rate.id
    end
    
    def rate_count movie
        movie.rates.count
    end
end
