module AdminSearchesHelper
    def options orient
        return options = [["-- Categories --", -1],["#{get_category 0}", 0],["#{get_category 1}", 1],
            ["#{get_category 2}", 2],["#{get_category 3}", 3],["#{get_category 4}", 4],
            ["#{get_category 5}", 5],["#{get_category 6}", 6],["#{get_category 7}", 7],
            ["#{get_category 8}", 8],["#{get_category 9}", 9],["#{get_category 10}", 10],["#{get_category 11}", 11],
            ["#{get_category 12}", 12],["#{get_category 13}", 13],["#{get_category 14}", 14],["#{get_category 15}", 15],
            ["#{get_category 16}", 16],["#{get_category 17}", 17],["#{get_category 18}", 18]] if orient == "movie"
            
        return options = [["User Name", 1], ["Email", 2]] if orient == "user" 
    end
end
