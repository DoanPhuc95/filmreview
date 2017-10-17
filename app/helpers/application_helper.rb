module ApplicationHelper
    def is_admin?
        if user_signed_in? 
            return true if current_user.admin == true
            return false
        end
        return false
    end
end
