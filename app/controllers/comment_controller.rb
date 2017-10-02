class CommentController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      @comment_count = Movie.find_by(id: params[:comment][:movie_id]).comment.count
      respond_to do |format|
        format.js
      end
    else
      flash[:warning]= "You can not comment on this review"
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:content, :user_id, :movie_id)
  end
end
