class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by :id => params[:id]
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.create post_params
    post.user_id = @current_user.id
    # @current_user.posts.create post_params
    redirect_to "/posts/#{post.id}"
  end

  def edit
    post = Post.create post_params
    redirect_to post_path/post.id
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

  private
    def post_params
      params.require(:post).permit(:title, :user_id, :image, :text, :date, :type)
    end

end
