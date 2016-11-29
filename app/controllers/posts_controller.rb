class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by :id => params[:id]
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new post_params
    post.user_id = @current_user.id

    # if params[:file].present?
    #   binding.pry
    #   req = Cloudinary::Uploader.upload(params[:file])
    #   post.image = req['public_id']
    # end


    post.save
    redirect_to "/posts/#{post.id}"
  end

  def edit
    @post = Post.find_by :id => params[:id]
  end

  def update
    post = Post.find_by :id => params[:id]
    post.update post_params
    redirect_to post_path/post.id
  end

  def destroy
    post = Post.find_by :id => params[:id]
    post.destroy
    redirect_to posts_path
  end

  def rate
    post = Post.find_by :id => params[:id]
    ratings = post.ratings.where :user_id => @current_user.id

    if ratings.empty?
      # If there are no ratings attached to this post with the current_user id
        # Create a new one

      r = Rating.new
      r.post_id = post.id
      r.user_id = @current_user.id
      r.save
    else
      flash[:error] = "You have already rated this"
    end

    redirect_to post
  end

  def comment
    post = Post.find_by :id => params[:id]
    comments = post.comments.where :user_id => @current_user.id

      @comment = Comment.new comment_params
      @comment.post_id = post.id
      @comment.user_id = @current_user.id
      @comment.save

    redirect_to post
  end




  private
    def post_params
      params.require(:post).permit(:title, :user_id, :image, :text, :date, :type)
    end

    def comment_params
      params.require(:comment).permit(:text)
    end

end
