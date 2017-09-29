module HomeHelper
    def comments_count item
        item.comment.count
    end
end
