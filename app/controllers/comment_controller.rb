class CommentController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      @comment_count = Movie.find_by(id: params[:comment][:movie_id]).comments.count
      respond_to do |format|
        format.js
      end
    else
      flash[:warning]= "You can not comment on this review"
    end
  end
  
  def edit
    @text_id = params[:id] 
    respond_to do |format|
      format.js
    end
  end
  
  def update
    @param_id = params[:id]
    @comment = find_comment @param_id
    if @comment.update_attributes comment_edit_params
      respond_to do |format|
        format.js
      end
    else
      flash[:warning]= "You can not edit comment on this review"
    end
  end
  
  def destroy
    @param_id = params[:id]
    @comment = find_comment @param_id
    movie = @comment.movie
    if @comment.destroy
      @comment_count = movie.comments.count
      respond_to do |format|
        format.js
      end
    else
      flash[:warning]= "You can not delete comment on this review"
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:content, :user_id, :movie_id)
  end
  
  def comment_edit_params
    params.require(:comment).permit(:content)
  end
  
  def find_comment param_id
    Comment.find_by id: param_id
  end
end
