class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    comment = Comment.new comment_params
    comment.user_id = @current_user
    comment.save

    binding.pry

    redirect_to "/posts/#{ params[ :post_id ]}/comment"
  end

  def edit
    @comment = Comment.find_by :id => params[:id]
  end

  def update
    comment = Comment.find_by :id => params[:id]
    comment.update comment_params
    # redirect_to post_path/post.id
  end

  def destroy
    comment = Comment.find_by :id => params[:id]
    comment.destroy
    # redirect_to posts_path
  end

  private
    def comment_params
      params.require(:comment).permit(:text)
    end


end
