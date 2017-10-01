class CommentController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:warning]= "You commented on this review"
    else
      flash[:warning]= "You can not comment on this review"
    end
    redirect_to root_path
  end
  
  private
  def comment_params
    params.require(:comment).permit(:content, :user_id, :movie_id)
  end
end
