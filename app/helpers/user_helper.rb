module UserHelper
    def get_avatar user
        return "https://www.timeshighereducation.com/sites/default/files/byline_photos/default-avatar.png" if 
            user.avatar.blank?
        
        user.avatar
    end
end
