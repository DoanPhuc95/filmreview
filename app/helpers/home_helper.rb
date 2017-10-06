module HomeHelper
    def comments_count item
        item.comment.count
    end
    
    def read_more name
        return name[0..28] + " ..." if name.length > 31
        
        name
    end
end
